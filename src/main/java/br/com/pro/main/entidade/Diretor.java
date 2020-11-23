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

public class Diretor extends Pessoa implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private static List<Diretor> listaDiretores;
	
	public Diretor(String nome, String cpf, String rg, String dtNasc, String senha) {
		super(nome, cpf, rg, dtNasc, senha);
		listaDiretores = new ArrayList<Diretor>();
	}
	
	/* Serialization Handler */

	public static void serialization() {
		
	}
	
	public static void desserialization() {
		
	}
	
	private static void saveObjectList(List<Diretor> lista, String nomeArq) {
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
	
	private static List<Diretor> readObjectList(String nomeArq) {
		
		List<Diretor> lista = new ArrayList<Diretor>();
		
		try {
			File arq = new File(nomeArq);
			if (arq.exists()) {
				ObjectInputStream objInput = new ObjectInputStream(new FileInputStream(arq));
				lista = (List<Diretor>) objInput.readObject();
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