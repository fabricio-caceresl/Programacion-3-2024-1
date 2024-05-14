﻿using RecursosHumanosModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionClientesModel
{
    public class Cliente : Persona
    {
        private double lineaCredito;
        private Categoria categoria;

        public double LineaCredito { get => lineaCredito; set => lineaCredito = value; }
        public Categoria Categoria { get => categoria; set => categoria = value; }
    }
}
