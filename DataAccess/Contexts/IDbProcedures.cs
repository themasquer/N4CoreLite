﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using DataAccess.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading;
using System.Threading.Tasks;

namespace DataAccess.Contexts
{
    public partial interface IDbProcedures
    {
        Task<int> NotOrtalamaHesaplaAsync(int? ogrenciId, OutputParameter<decimal?> notOrtalama, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default);
    }
}
