Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22920EAF1
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 02:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.143.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732501964; cv=fail; b=OGEAzFpPmej42asy7/BEJxggsIkUIgbI7LtJ0UqOK3A36LJ0k+dUsNtkWgJMLruaZ0aVkgHrjwxARHG0EjYf59xsX5tLRMjyI92QBge1La9vu1p7OHiD6AYp3LRdH1oAayv3o8zMuXzw14DPJyICDrqfx0A13gjwFt8jbgH5Zok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732501964; c=relaxed/simple;
	bh=jf7u7woIJpIlqCEDqcVIVXn/Evz4zO0Prtp9BqaBXx4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QOC7737pmyR+xBrhQ9CdqmvsZmVAN70DHxCIFjcoTkGSuLilTmDr2VCnsIy5M9BBZOMoohJ0f7MuQyUTlMUG3zSqRjI1CRZrNN9IUcQ3NvCVSQyECPmSYxMF6CB2qIESdDxeIRF9sYvojqHgU4duEIKP5M0sBXlt2A4ektjBO+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=Fq6Z7v54; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=FoV85njr; arc=fail smtp.client-ip=68.232.143.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Fq6Z7v54";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="FoV85njr"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732501961; x=1764037961;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jf7u7woIJpIlqCEDqcVIVXn/Evz4zO0Prtp9BqaBXx4=;
  b=Fq6Z7v54RHnhNy98Xw0IA3MJfYADw2Ykr/ASwi4woj4Eo1Nm6C5KCBGb
   AVQUIAM9u3sZZuwZqH35W2vhzzY+iHm/6El6TwE94jCWkZnqFqN5ukye0
   eaUo94W+ibZ2GeRFVEJrm4AF53a0KHhmImqBjczMjodNFLLCx+UlREkJc
   xJS5if/0y0NJC/l3zDvUGE9AfxX4o44pU8GFDY/nlt1t5M7pl8CPbyWVr
   n2GJYtQYtBVn2tt1KDUSO/Rwjo6QRIcmWsaFgGbY+eDusNDGjuc1Mtn1Z
   4+UGfWyPzPcdSwSEaGAEgUZ6My3GOHkBOxKgpJ506lyGbWdAyKLGJIpUc
   A==;
X-CSE-ConnectionGUID: Nh/PaTkKS5CY6y5+c5MwuQ==
X-CSE-MsgGUID: um277/KaQSS476s2Wo0sEw==
X-IronPort-AV: E=Sophos;i="6.12,182,1728921600"; 
   d="scan'208";a="32786979"
Received: from mail-northcentralusazlp17010007.outbound.protection.outlook.com (HELO CH1PR05CU001.outbound.protection.outlook.com) ([40.93.20.7])
  by ob1.hgst.iphmx.com with ESMTP; 25 Nov 2024 10:32:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/PXw8kYEMGCkCx39+wjGXhSKUQdqq15htgSZ+byWux52D7wQ9VGXu47u6QU1oIMvC75pSDGge1ja3txj2tYODk42ye59vwHJE8y0SRsfV8pGw/2GJDep3ulcbaS8Sldpgc2DR2YWJobD4n3ZulOXD5KQU/ARUhJwowz60ZS1WekFXCQVOb6Y2NIgUvxmvRaf1/pIuwOQ2Insj1XOKMDGPUMgsm5P2FHyWYpNtJ4C7RruaWSnbjOvvAwD0fXEPtI1P/n9jpcTX1XnHES3RrPnZzzng6E9Ce3mNd6UtRTQa0qZ+c6/M2Glb6VkpLc+80INvMjK9pI6itABdrKoqrd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1Zagmly7J+s14d5Vzib/WDg2KcQeVN2LUX1SjLw2f0=;
 b=fUQHb+zFxd3aUyWvIzrXHhUKXLcAn+OEkCC+5pm4BUNn/vEnNZQdKaoVJEKQTVUvVNv0j117aHjI5s6d4fazLgF2629/akAHH5+N4lUa28j6jeOB5crYdhyzv7tJCiCIMvsPQE53KNUluL7phd+o1JPg+KFRfbRmbssuDvZcrI1GEgC6DRIr/wFnojCa8Fd2g5m6nND3w5UxxQNYDy28oQYGeTSaCS5/90Oaxsrvgnoipbiotpj0p8Jqq8lhexWrOm5ijwWh0fJ0xvtN0Pr1wgwGPajZScSpMBVGZ3PW+17tTnJ4jv9vhDRi7ak4Se+rLBWYZZ8TjY9C42HBHd9qDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1Zagmly7J+s14d5Vzib/WDg2KcQeVN2LUX1SjLw2f0=;
 b=FoV85njrBokAngNSmtAHMCZEShDguiG5cKPIE9f+5v4d+/GPQSLTgjnXhxgxVBpTBnL7H+IKjBqAe7s5g6Aprod1939eITygGjZs9uZHGRw+tJ+pgQ7GWoJehCVpcSuOPA8r3xa1V4UmuwtTmoIEajvZRcUgKPtQXtbNIvkAkf4=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 BY5PR04MB6851.namprd04.prod.outlook.com (2603:10b6:a03:220::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 02:32:36 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 02:32:36 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"danielwa@cisco.com" <danielwa@cisco.com>
Subject: Re: [PATCH] p2sb: Do not scan and remove the P2SB device when it is
 hidden
Thread-Topic: [PATCH] p2sb: Do not scan and remove the P2SB device when it is
 hidden
Thread-Index: AQHbOxcvAf2vKyagwECEOb9eXKzFjbLALk2AgAcgFQA=
Date: Mon, 25 Nov 2024 02:32:36 +0000
Message-ID: <iu5e2k4ohdi2oisvt4oqf5nynq4nok52ikal2tc4dk2fo4pps2@w7ias4khic7c>
References: <20241120064055.245969-1-shinichiro.kawasaki@wdc.com>
 <Zz3nm-593xzUw1ZB@smile.fi.intel.com>
In-Reply-To: <Zz3nm-593xzUw1ZB@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|BY5PR04MB6851:EE_
x-ms-office365-filtering-correlation-id: 7d358c62-9709-454e-398f-08dd0cf96c5a
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3oGnHY7xpmzGYOt8bvAbxVW5PnY+hoSIg+6+NzLWpurLlGgXLr1+eV8lxkyY?=
 =?us-ascii?Q?lb2Scbl8a1YDvZeHCb+7DFLPdft6DH0M8Hbs4EhVS9eFain2oPrdyS6+mpwW?=
 =?us-ascii?Q?zQCAZUs7v4PUCa/+RmAeyK+gjSaqx30DcQ2GsMWWSG0J3IikxyfV4LmR22Jk?=
 =?us-ascii?Q?/wfdel3oayUFTUHF/8bzBYWKMuJx7ws0UZE6VS7fKN86fEbewEzC9jCoDMAv?=
 =?us-ascii?Q?j2EPDjWFuvVQc9fOQ8Bv1F4A4bWHbMMG5UpE84zjD7rGe8z+9C3YoV6QrczY?=
 =?us-ascii?Q?fkddY10PuzcuO5k6LtLz8I7ZLtHFCZHb2/OaJZilsFrSgP2xaJCCPB7sR0OL?=
 =?us-ascii?Q?ze4VkE/3XOhITPhsrq9KoRnp3COyCdXwdk3eFNuvjDP09UF8qUYskDpYcUJ3?=
 =?us-ascii?Q?xcKPZrLyDD1w4coFkzbHFBlrVeuOMgTEyZwBVDrHYIi7sJRExgHzktEH/vvS?=
 =?us-ascii?Q?hxYeGL7qKTe+xa7pIXzzLOr5RhUgXp4gzZmG8kaUQGR7a64SZ7aNMHIJu9PY?=
 =?us-ascii?Q?rnpg+22tYZao3HtXsb5SN80akQRVZqh7kvfbRk/X8SRzvuy9wsKbNOzIxfGG?=
 =?us-ascii?Q?d6AmdtSg3JopWJlAHCB5ovND5drYF8RQ5kOr4djQuQc66s9rEYQ/xvGcR4eP?=
 =?us-ascii?Q?iHbPBGcQZYGrVEhGerf9nI5adkWB6lEhrKa/jQ71w7MvZzgPVWFvdiyDXxJ3?=
 =?us-ascii?Q?81/CPMIxjwWFyPHWsG5CMKE70gDV1p1c4Dc9v/mmXuZAXjsDJb5JQ0iymwGb?=
 =?us-ascii?Q?BM+L4LP20e1mlX3bk2mAN4Rb6kskVS5N96KGlYrut3piX76epOHR9WTFhGHz?=
 =?us-ascii?Q?UGHzMfrP+8o0zW7wc+gfIHs7nqsZEq0VK8AnL5ZwX7Cis52Ure3MIibqLh0G?=
 =?us-ascii?Q?GWVm0sOWmzn/F5xGeru73U6j4u6UFnSbOZU2I2sT410cg0b2cstasfpBdst/?=
 =?us-ascii?Q?cUt8NN527jQm9Rf1e2Lx9hEM0AeKKl6FmSgIOVliDAhP8bnygg6q0EV7HvgF?=
 =?us-ascii?Q?I7Uq4XXlqOnmx18k4WwazeEOmr/zeORjbnMNW6vbGIg0Tpbl53cExMBY5aVz?=
 =?us-ascii?Q?Y9lyU+x2REIQmi28SY/leFUt/GIgobrwDRKO58m+3A9GppApjgKWOy+mNo2y?=
 =?us-ascii?Q?W9B2pKP/e3pT+aLPrVtzUD3mH2b4lKryxVvnB/GJVHnIdBLee5lqFttQIABc?=
 =?us-ascii?Q?ERAX8635yUkn9cbyxeNPbc/RIfyCLC6jGBpHI+JAFW1Co9ajEs8vWEwpr7We?=
 =?us-ascii?Q?xAggFM/3teBDsFpFef9ZJV7ExsV2QsRsrKlAhfTU2PwB6MScRXrObJpSLaYv?=
 =?us-ascii?Q?N35PzuWgs4FRaSXBg8/HS7cq0wCcWTKdrBoQIEL4gE6ANTsulFWdVRG24NXv?=
 =?us-ascii?Q?XoHpbtmQKDRv/6BG5UcnXxFW8ZUQ0jCWmiP5jgN2J5p3X5xcMw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BwKV6SFY/XduEmtzRR0zoepMuLazGlWLV0YH0S40kuW0SX5V72GFT/mS3+9h?=
 =?us-ascii?Q?1XJkcP9HgZY9k4GaX+DZFoxQ3FOyo9X3hv9j8Jgv8SiDvSDEyLvoxdSl04Hl?=
 =?us-ascii?Q?Y6kMlT5l5sqXGAlKIGdu78KepU1BVzS6bwrtuzUo2FWH4rMJ30qvQ2amxco0?=
 =?us-ascii?Q?C61KeCdtJ5TOnVINZGb47FgiUGZ5Zuc2DfzZwwIHfW5nvBoRIMFaUGLEkv35?=
 =?us-ascii?Q?TOovPG0koOslt0MoY9ImU1RsboADRkMJ3EKPBHNW+eMR6hrQF5Wnf7DUvdD2?=
 =?us-ascii?Q?sfESm6vMYULV02wc44wZw3Gq5ntErMj7uqLU4z0gRayIQIYbc9fJpKbIrVbo?=
 =?us-ascii?Q?PHRbOluzzrfODWeTm7zZkmOto/j5viJ0FOdbcPh5S2y69+fetLP9Ufpxp4p9?=
 =?us-ascii?Q?XNDpBQcX4JIZRKUBmWKesRIxo8/QfihNoXV4q5aRU9mYZpHltX2xxz4S0z4d?=
 =?us-ascii?Q?hdayovtmu4dosbksy5MuRH5zdGe1eaPaqP7T+C2vxZXYJP0QzwII3FUR+48X?=
 =?us-ascii?Q?sGNk50VDIhxulgS8oK4Lf3ABwT+ksXQSXqv1suz8xeD2AWE/gH3afYOt3ICb?=
 =?us-ascii?Q?GCQPODHl12VoMT/BgfwE1O/Ommdg3Pgrcw1p+EK2XBS8zF3FMknXiQqK62mY?=
 =?us-ascii?Q?mQHAldu0eMAz+zH3VILKt06AYrudei2hSs9qfjFGHURRZipqnKeD+FtBXEDJ?=
 =?us-ascii?Q?OrSiz0Ah30yUAWuZNwTSP/vBeT96M5O3o5fbbwXJuGqaYMMyGQ10R2n/7qQp?=
 =?us-ascii?Q?bRuvLIjYGqce3zmLNz9yDHgtNgxIG3odHymUHSWxQP4R5ZezQ8KQC2yYszbo?=
 =?us-ascii?Q?kfB0EMaNuKPFirFY85CY5dUlZ8S2Qabrp1BuHDlr3i5tTL/tZHdqGOt7Ec1n?=
 =?us-ascii?Q?8P4H1e03b3nzzwYCMd56sPtn8gui8Fz7xKd2QxVEvmqu9UqfLKMFEKu7kSSG?=
 =?us-ascii?Q?qeb0FoDa0bthLQ5O4ja6qEU8H0A22YfNDLnb2MFlo5hKxNE81Bd/ZcHzKlD+?=
 =?us-ascii?Q?psoGibqHJkurbnqZ2OdqHJGXBOF3qYtHKPgP4kqcLKhOSDL5TV4LT1wdFexs?=
 =?us-ascii?Q?r8KLazwLM8eoc7crpc43WoH4lK2aelhK82mozjRmtb/VJh47+2OfNAtPUw9q?=
 =?us-ascii?Q?DCrInR37JIFrpCItMQw6aXX6+foBEYnIVc5ElRxF82dEUK+TEukga2AiN2O/?=
 =?us-ascii?Q?pyjcKplQLwmXPgf+co5Q5BDt9WludnyEXoQAPOgjr0TlMx17bO0vTaswzABx?=
 =?us-ascii?Q?eTF3Q1QbWSggUWvxwn/2exauWN1ZLeDvCgX+fdV/dwnRPBR3y+R/dmnrgL8c?=
 =?us-ascii?Q?tbbdwG9dJJErKT8moguzcZ6EsjRmUj4rlln0ljmYE8qvziRXmi+QcSlIpraJ?=
 =?us-ascii?Q?+754M3WmHbted7GcC324oHWUmzRlmUJMLQcKR1B9bn7A3nivz6naX/B5yI7s?=
 =?us-ascii?Q?p0xamvo5E0WCAb9sHE5K9oQEe4TRQZgKVFCyli/cKStuWmInPEFTfopaMQ62?=
 =?us-ascii?Q?ZeEpgfKX1L2hvyEr/UcSaGcVEr3LRX+/DxTk7amgl4LErZt4Hog5DnBJ6CRM?=
 =?us-ascii?Q?u+WFQcevNQMEgMQR/WJ5EeeXsj4KvKbhWzrxgm1ESYxSIROeKeXESMXy2+0H?=
 =?us-ascii?Q?aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <335764E09A5D5F4784B83230CD1D764C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gKIB3WPHeB7Px9IySGImGQWAdNdmBp8H9hjQA3xbSEpK1FwVSbAEjKK986b5agj4dqAFgHzb4N1IAV91yq4TyyegHWRBNWnqHCO6DVTvposqNN94ephRTH50LqgVEM/T7hdpIiaXZTMaow9Y1l4Nk2GLnX7AyymdhKn7vFSSzXVURtlCzTVyuCFbNeP/whLoazGK0QOsgiQGBI6TdxnnHvgXbqeUvEjyyR6dJeIhgHm1aEDhEZPekh0kQ8QVDSZgBai0AA3fBmmKMLSiYGWOVQRrXPZ9lIwz5n2+uRy3IJrw/16JVOE5/ibonDZcqIqA1SbUq7U7yUaT3KYMInRvCJr4u4EabSiOhZuVXgExtjDVxs5oPA6H+iA22ZKNa2Kyzu2pWFYI7n8tAMKOFs0vO85eldh2rkg/39kRhF9gM1YllBMZ2qahNtxV3PqrkOj4voMYn3cnoolRm3fKhG9ogA3tncmVdQOKzPp1h1YPlMJp0JOgS/vkAQaAOzc3rkj88w4VDxaUs24JxXNcnARzeZMLa+L37uA6IdSpDeHUh6m04SKP/DFXBBEvCm2xy46bcTnbuOXUktVzyrViYCZcu0oWChrb+jKp7s2p88yUzR2EtagR0eCBKBHBRJWWqXpm
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d358c62-9709-454e-398f-08dd0cf96c5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 02:32:36.0465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e/+6JLCGLK9kQ07wcEdN1hoHwIaxUnNa/HB8mel07+hl2T1Iry6qzR0+sNoQXd7n0hseXgbVB8uJTpZ+FPF/8zNFd1MHC3WEdJWqHl0Du4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6851

On Nov 20, 2024 / 15:43, Andy Shevchenko wrote:
> On Wed, Nov 20, 2024 at 03:40:55PM +0900, Shin'ichiro Kawasaki wrote:
>=20
> The subject probably wants to say "unhidden".

Oops, thanks.

>=20
> > When drivers access P2SB device resources, it calls p2sb_bar() to obtai=
n
> > the resources. Before the commit 5913320eb0b3 ("platform/x86: p2sb:
> > Allow p2sb_bar() calls during PCI device probe"), p2sb_bar() obtained
> > the resources and then called pci_stop_and_remove_bus_device() for clea=
n
> > up. Then the P2SB device disappeared even when the BIOS does not hide
> > the P2SB device. The commit introduced the P2SB device resource cache
> > feature in the boot process. During the resource cache process,
> > pci_stop_and_remove_bus_device() is called for the P2SB device, then th=
e
> > P2SB device disappears regardless of whether p2sb_bar() is called or
> > not. Such P2SB device disappearance caused a confusion [1]. To avoid th=
e
> > confusion, avoid the pci_stop_and_remove_bus_device() call when the BIO=
S
> > does not hide the P2SB device.
> >=20
> > For that purpose, add a new helper function p2sb_read_and_cache(), whic=
h
> > does the same work as p2sb_scan_and_cache() but does not call
> > pci_stop_and_remove_bus_device(). These two functions are almost same
> > except the device scan and remove. Then make them call the single
> > function p2sb_cache_devfn(), which takes the argument "bool scan".
> >=20
> > If the BIOS does not hide the P2SB device, just call
> > p2sb_read_and_cache() to cache the resources. If not, do additional
> > preparations (lock "rescan remove" for parallel scan, and unhide the
> > P2SB device), then call p2sb_scan_and_cache().
>=20
> Even for the simple read case we have to do that under rescan lock.
> Yes, it might be just a theoretical issue, but that's how makes code
> robust against possible enumeration changes at boot time.

Got it, thanks.

>=20
> ...
>=20
> > -static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn=
)
> > +static int p2sb_cache_devfn(struct pci_bus *bus, unsigned int devfn, b=
ool scan)
> >  {
> > -	/* Scan the P2SB device and cache its BAR0 */
> > -	p2sb_scan_and_cache_devfn(bus, devfn);
> > +	/* Scan or read the P2SB device and cache its BAR0 */
> > +	__p2sb_cache_devfn(bus, devfn, scan);
>=20
> Strictly speaking we don't need to cache values when the device is unhidd=
en.
> Moreover, the rescan can happen in between and the resource relocation to
> another place, which makes cached value invalid.

I see. I will create and post v2 patch based on your comments.=
