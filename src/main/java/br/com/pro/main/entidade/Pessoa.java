package br.com.pro.main.entidade;

import java.io.Serializable;

public abstract class Pessoa implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String nome; 
	private String cpf; 
	private String rg; 
	private String dataNascimento;
	private String senha;
	
	Pessoa(String nome, String cpf, String rg, String datatNascimento, String senha) {
		this.nome = nome;
		this.cpf = cpf;
		this.rg = rg;
		this.dataNascimento = datatNascimento;
		this.senha = senha;
	}
	
	/* Métodos Getters e Setters */
	
	public String getNome() {
		return nome;
	}

	public String getCpf() {
		return cpf;
	}

	public String getRg() {
		return rg;
	}

	public String getDtNasc() {
		return dataNascimento;
	}
	
	public String getSenha() {
		return senha;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}