//Iniciando o primeiro estado
estado_idle = new estado();
//Iniciando estado Walk
estado_walk = new estado();
//Iniciando estado Ataque
estado_attack = new estado();

#region Estado Idle

//Iniciando o estado idle
estado_idle.inicia = function()
{
	
//Definindo a sprite pela direção	
sprite_index = define_sprite(dir, spr_Jogador_idle_side, spr_Jogador_idle_front, spr_Jogador_idle_back);
image_index = 0;

}

estado_idle.roda = function()
{
	//Condição para trocar de estado
	if(up xor down or left xor right)
	{
		troca_estado(estado_walk);
	}
	if(attack)
	{
		troca_estado(estado_attack);
	}
}

#endregion


#region Estado Walk

estado_walk.inicia = function()
{
	
	
//Alterando a dir com base nos inputs
dir = (point_direction(0,0,right - left,down - up) div 90);

//Definindo a sprite pela direção
sprite_index = define_sprite(dir, spr_Jogador_walk_side, spr_Jogador_walk_front, spr_Jogador_walk_back);
image_index = 0;
}

estado_walk.roda = function()
{
//Alterando a dir com base nos inputs
	dir = (point_direction(0,0,velx,vely) div 90);
	
	
	
	//Ajustando a esquerda e direita
	if(velx != 0)
	{
		image_xscale = sign(velx)
	}
	
	
	
	sprite_index = define_sprite(dir, spr_Jogador_walk_side, spr_Jogador_walk_front, spr_Jogador_walk_back);
	

	//Atribuindo inputs a velocidade
	vely = (down - up)* vel;
	velx = (right - left)* vel;

	//Voltando para o estado idle
	if(velx == 0 && vely == 0)
	{
		troca_estado(estado_idle);
	}
	
	if(attack)
	{
		troca_estado(estado_attack)
	}
	
}

#endregion


#region Estado Attack

estado_attack.inicia = function()
{
sprite_index = define_sprite(dir, spr_Jogador_attack_side, spr_Jogador_attack_front, spr_Jogador_attack_back);
image_index = 0;

velx = 0;
vely = 0;


//Criação do objeto dano
var _x = x + lengthdir_x(16,dir*90);
var _y = y + lengthdir_y(16,dir*90);
meu_dano = instance_create_depth(_x,_y,depth,obj_dano);


}

estado_attack.roda = function()
{
	if(image_index >= image_number - 0.2)
	{
		if(up xor down or left xor right)
		{
			troca_estado(estado_walk);
		}
		else
		{
			troca_estado(estado_idle);
		}
	}
}

estado_attack.finaliza = function()
{
//Apaga o objeto dano
instance_destroy(meu_dano);

}

#endregion


#region variáveis
//Local de criação das Variáveis
//Controls
up = noone;
down = noone;
left = noone;
right = noone;
attack = noone;
interact = noone;

//Var movimento
velx = 0;
vely = 0;

//Vel jogador
vel = 2;

//Direção que o player olha
dir = 3;

meu_dano = noone;

#endregion


//Iniciando a maquina de estado
inicia_estado(estado_idle);