package br.com.pro.main.entidade;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Professor extends Pessoa implements Serializable {
	private static final long serialVersionUID = 1L;

	private static List<Professor> listaProfessores;
	private List<Aluno> listaAlunosDoProfessor;
	private Disciplina disciplina;
	
	Professor(String nome, String cpf, String rg, String dtNasc, String senha, Disciplina disciplina) {
		super(nome, cpf, rg, dtNasc, senha);
		this.disciplina = disciplina;
		listaProfessores = new ArrayList<Professor>();
		listaAlunosDoProfessor = new ArrayList<Aluno>();
	}
	
	/* Serialization Handler */

	public static void serialization() {
		
	}
	
	public static void desserialization() {
		
	}
	
	private static void saveObjectList(List<Professor> lista, String nomeArq) {
	      File arq = new File(nomeArq);
	      try {
	    	  arq.delete();
	    	  arq.createNewFile();
	    
	    	  ObjectOutputStream objOutput = new ObjectOutputStream(new FileOutputStream(arq));
	        
	    	  objOutput.writeObject(lista);
	    	  objOutput.close();
	    
	      } catch(IOException erro) {
	    	  System.out.printf("Erro: %s", erro.getMessage());
	      }
	}
	
	public static List<Professor> readObjectList(String nomeArq) {
		
		List<Professor> lista = new ArrayList<Professor>();
		
		try {
			File arq = new File(nomeArq);
			if (arq.exists()) {
				ObjectInputStream objInput = new ObjectInputStream(new FileInputStream(arq));
				lista = (List<Professor>) objInput.readObject();
				objInput.close();
			}
			
		} catch(IOException erro1) {
			System.out.printf("Erro: %s", erro1.getMessage());
		} catch(ClassNotFoundException erro2) {
			System.out.printf("Erro: %s", erro2.getMessage());
		}
	    
		return(lista);
	}
}