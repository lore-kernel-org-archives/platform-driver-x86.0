Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D741322D
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997455; cv=fail; b=U1Kpb4d2CUEynKDE5jC3xIRhtPKMl/G2DBYBTVZC0kCsI1U/vtM6CPH94I9zOkAyHWi96rFgiCNaHJg0tQM45q3er/IcdZu8NAkhg3bcTLTWy676BBkG+5xboRgMJKHPq+TjesUDwAdHT6T/r/GWmgXEFLp3osKgPvAamN4IqCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997455; c=relaxed/simple;
	bh=PMr8oH/F7L7/lj+HVWtU+MOHIlyyOXxUA+GGxmIAmkw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mtxBxN1I62A7shFMn9Fv1KLFpBFzm6G25xAnPm3gUWHl+FbBcMHsNvZ/YvLsg8FXgJtsh7O3HOsUyVQDMyNZvmJhIfdN9LvPmDb7Ktb07qGQ87Eb7JJtI1uMhwhs/ZCQdpcBe8EmUG75aPj1X9W6km8aBKUhbz9r5uM2fAEW+v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mYq/TpgG; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mYq/TpgG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wixJ58bucBoLL0VW7Xye4UQCo6NLkCM9oCRo5XbOHL+zv53PaRUplvy8QECYQOrVRkx+JGAMjXTxFEzS81FjO6mpBHTIslFm5dydaThbprFKIdCnRnIgt1+irUPLwjy0KP4wW9beK9/99ilVRNeJVtFaW05CUF8vUB9T2fjNxYDerz1xxbxg+S3q0Vit3SoKjheXfYodF+G6sGuEwDe7gymXGqMGDnJZxi7uz0PaEW1T5ce8LIkhTy53Q7bnsi4teUEngm/c5fJ3Orf+XO9ZNW98y0BHO6veY2tBGyX6YcE4SQ1Tzc1qWdh7iUlLvDLlw7q0h6FxUfEsUCbPpqoPjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBipvdPWoXPq8M+mpWqmoxIekKHn6H77qPkX6rHsMOY=;
 b=k+i+3XWfpvODkdNcFJ7ULt8Pq2S06IrJmLb0mzvqc+buiB8S+NYKonp5uqcrKxM4kgXMmFREorJ407KspaF58zFIhBZey9icr5Se7OrFBCYsgXATfhD7LUxq1SZsPKkKDDd6K7lSo8ww/V+PwTAwMJeDHHWPHJIgeoEbJmDYNHDS3rJ98kPF0fbDJNOJV4Oc4ykpWyI253dSVaEvW86aMTE6XKKqiWqlcrkw0P6nGaBHxwCZknUtFjYNr66ULxgsX1gyI7a8NChlwAnDtN+2fXCVxZw4bSTj3zh5ReaHHCKYjvFFuYIFy3IUXv9C4xx/Kcbpj9OftgwqN68jBPl6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBipvdPWoXPq8M+mpWqmoxIekKHn6H77qPkX6rHsMOY=;
 b=mYq/TpgGsR16/ihHO4yq0/sbBLas6Hb0us4oQOKHHoRRZmbRWSNOf0AuVcC0sy/oFb45yNx+AVdAvgaTXC9H+HX5iVfpVvYKo6NbFBsOAxlnEtVfY3Io5vWGXhvj+Lxb+IkwIVUhAli9iTtPrCxduBot3L+1DCF3xzc6oUDJnn2JVls29PmGr5Qi9FZxqURJURmmra5X9WwZRBQIsz3niZfpSnSzgzhUpi5vs/ZcWZFxtXxifH6Y0ml0bB/9c+b+NdXeIyvvvxrbJlpoqat9sC0wnsM5zh3brtiMfULdOD7n5xSPJid0d3pOD4tIL+qb6l57XZih1jehuCun8wQgOw==
Received: from IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19)
 by PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:10:44 +0000
Received: from IA1PR12MB6236.namprd12.prod.outlook.com
 ([fe80::fa0f:8fea:6e7a:26db]) by IA1PR12MB6236.namprd12.prod.outlook.com
 ([fe80::fa0f:8fea:6e7a:26db%3]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 12:10:44 +0000
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>, Vadim Pasternak
	<vadimp@nvidia.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 1/2] platform: mellanox: mlx-platform: Add support for new
 Nvidia DGX system based on class VMOD0010
Thread-Topic: [PATCH 1/2] platform: mellanox: mlx-platform: Add support for
 new Nvidia DGX system based on class VMOD0010
Thread-Index: AQHcf+AIDRKvQYd/aUyZNCwj/oD17LVTOlcAgAlcWeA=
Date: Wed, 21 Jan 2026 12:10:43 +0000
Message-ID:
 <IA1PR12MB6236E7A4B8C4D487F25F4993BC96A@IA1PR12MB6236.namprd12.prod.outlook.com>
References: <20260107141417.913935-1-oleksandrs@nvidia.com>
 <20260107141417.913935-2-oleksandrs@nvidia.com>
 <3b9b8a5e-2f51-2fe4-5af7-d617eadb8742@linux.intel.com>
In-Reply-To: <3b9b8a5e-2f51-2fe4-5af7-d617eadb8742@linux.intel.com>
Accept-Language: uk-UA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6236:EE_|PH7PR12MB6858:EE_
x-ms-office365-filtering-correlation-id: 1a7cadee-9c24-4e18-c8be-08de58e61a49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?aWTC+6ejM21/2KsOt/YdQ5mnOqdjkua0nxsG786MLJqOqizr0FBQaXZgkk?=
 =?iso-8859-1?Q?0baLnSyjkEiTaPvsdlhwAhfXJ//6VS1xznNs2IHIx7AaxJLo1oR+1upMZN?=
 =?iso-8859-1?Q?zmCOu6Ikt8aEgeJNiVvKrDChhThBJq7WOz8OWmDxPjOwa5+G1NBZ9AIBEQ?=
 =?iso-8859-1?Q?O9rSMAbdhf+r6ME8y3IEyTuIXwi4L3p92dP6bYbYijuZHSYwuAP4+aQ/cF?=
 =?iso-8859-1?Q?bBV6CcQFrsuoZkkD98bHdy2vXYOuvOE+dVrWsM/wQcPl2M5BG2gQugClxE?=
 =?iso-8859-1?Q?6UbbYA1pHmIwi/LGM6p4cO2MgeSnQGfsP4C+UAgCL1i9ksbPI+hC+Tmm9k?=
 =?iso-8859-1?Q?5FbecLXyQ9FIvNZMBBx9Rl7XtCpnrNhsgWVrwrSWJStQvRaMINHUbcoXHr?=
 =?iso-8859-1?Q?JMi82UYk+eHVBQ7AQbFhUCH33dX4hIDlGlrYLH58vSGD9nbl3i2z221e8x?=
 =?iso-8859-1?Q?1qZ43XL6ABW0Ot1xtORNgFsNaPTm4wrsvFUl/+YZ3pld8XoFPiqWOatXv8?=
 =?iso-8859-1?Q?IkOAWvwFJh9r6pLt6jPbg+rZ61BAdA1AmCHYrLx8z3yCdh55UjUuHAK304?=
 =?iso-8859-1?Q?+vGEZppEfF7Qk29QWE868H0PlIxEnJ+3V2eZNv4FGhUlk4PEycf2uxBxjF?=
 =?iso-8859-1?Q?16Gy42AGvbd+WHdnmnRW/K8tjZG3r9P0M4t2DftgI1i7pWm/Hxw3gMPsqN?=
 =?iso-8859-1?Q?opjMmGUvx42ji1iJ4rJ69PP9+f7M61Y9+YbgbcGWgbi1IGiQrlifgNvwNE?=
 =?iso-8859-1?Q?cuURFjt/1oEVwG9lKrAWD0l/lV2PTFw1P6cW2fCXEMkowTaDQaMJ8oDqxZ?=
 =?iso-8859-1?Q?a/lbBWm4U/uWB1D//Ynzu4L3RyIKfzkKIvajxFzxtthxqhnCe4zLMNu43c?=
 =?iso-8859-1?Q?F+5hQZw/KS3t1bt+3Z6yvMIt2SlarAQUAMxCHlGAo7JWtdqKMPX2fLPnCU?=
 =?iso-8859-1?Q?Eky+wzhJybyQ4AaVFsewLin5fl/tWs9TFaG8FFnudkNCg1tErJMEgisgfX?=
 =?iso-8859-1?Q?Ddof0crEk89WpoDQYEVfp3zxc/IN1HZ5OnOEPIPlufJhunB8GUanEQwpsZ?=
 =?iso-8859-1?Q?8mGqxZD7bwj2/Ua4SBjmAxtgUsDMA/VjeL0Ofo4Z9vO4vIq3RhaD5m+k1D?=
 =?iso-8859-1?Q?KBeiSDBhPBAYxZn1j6R4P2TtWpO2rEzQJcH3Qv26zOc7H9l/4hAtGYeLw/?=
 =?iso-8859-1?Q?S5lUbp/KGHcFVQtdaSov8Kb9Tnia32zw2Inptvc6WRK7ggukNzVzMYaR4w?=
 =?iso-8859-1?Q?pDr/rom06ScZjXFkybkgRzM51rGak7nZu7MXh+sCS9q6NNn36Pdo2+CtO8?=
 =?iso-8859-1?Q?NuJWOmjjx03nvrU/VJz3zD9unKyFwLO8Mmoalj/xrNDMjfLWzTXw+u9EXD?=
 =?iso-8859-1?Q?kfsbVVG+ZYHtSv1PNGlG8a71sYLo3wocLkmxye3CKC7juZSPEyEoxghm+C?=
 =?iso-8859-1?Q?c5lYriqAx3Gyv/EaSaOYf+1ZuEx/a/GGcrBS7bRzlycMDIaQaKng+srGrS?=
 =?iso-8859-1?Q?ooVXd7LQM6FlqMNGVjJPz6o5tWL5tJTBNQRDJbbju6V1ulRNZdHR/dvy9Z?=
 =?iso-8859-1?Q?gND+PcqHI647ao7tnkS2ELeyMcc59CSkdwYVHBOCh9iLnuBGoG5V0mb/Lw?=
 =?iso-8859-1?Q?cd0yo/NQntP6EdRz8nSs0fZWHoNKV/gvsFAI1HxbT6SxiYW7o5JVYrrZYp?=
 =?iso-8859-1?Q?2U11mT6k27MdXRn9Hic=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6236.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yc8wrfUOUYWHPj4osmq8g0q3WR6iFjLF5wNZw58y6w/SVHLkEQ/YeUqVno?=
 =?iso-8859-1?Q?QJycD6L/cDagxuyCKD13XYWql/YyJoLdq8ZLGvE64sCWKMfUHwzav7R4f6?=
 =?iso-8859-1?Q?u2RJIdEUNAI32B2sQSDI+z8ujktsFWgaKePcOiXHLJmJcaYsix/rm+e7Uf?=
 =?iso-8859-1?Q?eOAcHurkN92C7gOU71V95WqTeLV7+tjuFXQ8KK1C2USKS1CYr7SF6q3+Q6?=
 =?iso-8859-1?Q?WjaWKGI11Hn3QG44HG/LBXB8Y6j44Qffv4QBRORjm6Z8Jz+RfPuHgLYfQx?=
 =?iso-8859-1?Q?R6tIR+9mNxN7bFfhmZmfox7Ta04LN7GPhlDb1QVVjnlc82zQh5r+aNcwME?=
 =?iso-8859-1?Q?uQad+rgfeomh1YFTumA9bJ1RLCVtl8GMH56tCreKbj4xWNkZeHCfips4ne?=
 =?iso-8859-1?Q?v46IkSJ7nwLKHXYsEMrHTgu/ZrN7GZcBr1Wq+9bNDsAP+U1D13c1rCqz+0?=
 =?iso-8859-1?Q?+4/7NtF3vOfXfdJiI7FPGL99T99SYSuCq06VIzx9rUg7ywI77Q9wYKDQrq?=
 =?iso-8859-1?Q?GnSWrihHW7OrQLBW7zk/4tN1TKwSn8Qx5kY9n//EOVlPKnuoC0vjXqOOkn?=
 =?iso-8859-1?Q?n2XYs5dbJZE+h2o+278x/IfYKhNB18QODdMV8zmjwxEIDZn5GVDXGOm4hb?=
 =?iso-8859-1?Q?pjDzrXtvS3i7Q5nqN7m7CmbLXWeIMjug6bxMQNBcCm7S0jQdoor4Qhcmfp?=
 =?iso-8859-1?Q?+TPASpLll2VoboheVou6qZaLzINJf7HlEiKQqEWgZB3WMatKB7+gb8FvoQ?=
 =?iso-8859-1?Q?grjgC+OFLRBwsRFPWavT1rWrrZsEm2frbWCSYxXu54jwY2AZ7wPV8lMvz+?=
 =?iso-8859-1?Q?cBVlmYRhoriJi4y8blEL26+tLeZ+7o45REbVl68TQzhtaEh0p4GBV6Ycn2?=
 =?iso-8859-1?Q?SAf+sLcpMk9gsXb36zKDtRWZawJNqzqsP/5RzEvGyvcSShZ2cdBO0XwWHr?=
 =?iso-8859-1?Q?xK3asK0t0ye301f9VI1iJxB8iS/O9ifEWuNYh+mNvNGUtPSElyS8XNXnKL?=
 =?iso-8859-1?Q?7ZdQDL9soyYJxzqKZU5DCzl+nS+754rwmKcrIWLM4bq90IqBRnD89AxJja?=
 =?iso-8859-1?Q?gx7YZ7jkvzPmOQxS+GW3cZJBa8alPww8q3KtDuTwSySub1RT3TvYFuFfWU?=
 =?iso-8859-1?Q?tE5HDU5QmdgJqlJVGA6ZSv+ka38bPxPTKYGcHGE4K71VgeNU/tA+hoYwfn?=
 =?iso-8859-1?Q?yPJvlcszqdgxyxINcfHNYfHVKwzMNryjvS8k78UxsoHOEQxkGZO4d3TQyK?=
 =?iso-8859-1?Q?fPfr0OVdz+Xj0xmBPryU1yNyCP5xnq5IZSfVfRrdtTuS/ehj7CO4/pB9vx?=
 =?iso-8859-1?Q?CJlWbdhjsjoE5kNKAdthCU+tBZlraOqS/gZBXPi6R59nBhLmYAyo1UeBUR?=
 =?iso-8859-1?Q?pCJYXWzf9GKLstx26NIGVs1m596O1ed4RHB1lIzsx4skN+Lm40Wy2BQbgm?=
 =?iso-8859-1?Q?5S9r2ZXHM4W4hx3fQV4RtOpKmZY9RBwiyW6HOIGSDIzIplFrHtHcbMgCn7?=
 =?iso-8859-1?Q?j81SAnIYj2a33R8dGCa3xCRU4+DdF9YD3io9XjQeKqe6ou4SxGSnIhViUq?=
 =?iso-8859-1?Q?6tpkRDdeFGkpmyOJbr2GHTX98HGCvTr95J+TEhI/5mXv+XZkd1YA/o5Kze?=
 =?iso-8859-1?Q?/bOY2BFVzGYhAaDmAZf3nzlC4aCb1Puum0b62P5HNsqe5VLAniX6gk3czt?=
 =?iso-8859-1?Q?R1z2NwoD+fbHXA4uxxIZVxTpznUkJfWukFJBzXLk2uX1sUK21LtraRofEw?=
 =?iso-8859-1?Q?LNo5PbH97Xq8NiGeZms+lkHCXwdZ6YVlwpXe1FogAWZePV6wouMblkARU0?=
 =?iso-8859-1?Q?kE5JF30aYg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6236.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7cadee-9c24-4e18-c8be-08de58e61a49
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 12:10:43.9633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ai3ovRZFFwVQUP4DY1N0gJM6i9WjzmqJIR+Y1GSaVzgxOabDJxHNdoPKIIC/ReG/Em7b0l5gzlSEIIS3pvv2hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858

Hi Ilpo.

Thanks for your review.
I'm not sure which header you believe is missing. Are you suggesting that w=
e should explicitly include <linux/bits.h> and <linux/array_size.h>?
Could you please clarify?

Thanks.

Best regards
Oleksandr Shamray
Mellanox | Software engineer
e-mail :=A0=A0=A0oleksandrs@nvidia.com
NVIDIA=A0Corporation=A0

-----Original Message-----
From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=20
Sent: Thursday, January 15, 2026 2:47 PM
To: Oleksandr Shamray <oleksandrs@nvidia.com>
Cc: hdegoede@redhat.com; Vadim Pasternak <vadimp@nvidia.com>; platform-driv=
er-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform: mellanox: mlx-platform: Add support for =
new Nvidia DGX system based on class VMOD0010

On Wed, 7 Jan 2026, Oleksandr Shamray wrote:

> This system is based on Nvidia QM9700 64x400G QTM-2 switch, with the=20
> following key changes:
>=20
> Key changes:
>   1.Power Supply: Rack busbar input power ORv3 DC 48V-54V
>   2.Dimensions MGX/DGX 1U compliance
>=20
> Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlx-platform.c | 454=20
> +++++++++++++++++++++++
>  1 file changed, 454 insertions(+)
>=20
> diff --git a/drivers/platform/mellanox/mlx-platform.c=20
> b/drivers/platform/mellanox/mlx-platform.c
> index d0df18be93c7..14b3adf870e7 100644
> --- a/drivers/platform/mellanox/mlx-platform.c
> +++ b/drivers/platform/mellanox/mlx-platform.c
> @@ -727,6 +727,16 @@ static struct mlxreg_core_data mlxplat_mlxcpld_defau=
lt_psu_items_data[] =3D {
>  	},
>  };
> =20
> +/* Platform hotplug dgx data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pdb_items_data[] =3D =
{
> +	{
> +		.label =3D "pdb1",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +		.mask =3D BIT(0),

+ include.

There seems to some missing includes in this file (a pre-existing problem, =
I know). Please go through what you add and make sure you've the required h=
eader included directly by this file, thanks.

> +		.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +	},
> +};
> +
>  static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_items_data[] =
=3D {
>  	{
>  		.label =3D "pwr1",
> @@ -776,6 +786,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_defau=
lt_pwr_ng800_items_data[] =3D
>  	},
>  };
> =20
> +static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pwr_items_data[] =3D =
{
> +	{
> +		.label =3D "pwr1",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +		.mask =3D BIT(0),
> +		.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> +	},
> +};
> +
>  static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_items_data[] =
=3D {
>  	{
>  		.label =3D "fan1",
> @@ -1399,6 +1418,45 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext=
_items[] =3D {
>  	}
>  };
> =20
> +static struct mlxreg_core_item mlxplat_mlxcpld_ext_dgx_items[] =3D {
> +	{
> +		.data =3D mlxplat_mlxcpld_dgx_pdb_items_data,
> +		.aggr_mask =3D MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +		.mask =3D MLXPLAT_CPLD_PSU_MASK,
> +		.count =3D ARRAY_SIZE(mlxplat_mlxcpld_dgx_pdb_items_data),

+ include.

> +		.inversed =3D 1,
> +		.health =3D false,
> +	},
> +	{
> +		.data =3D mlxplat_mlxcpld_dgx_pwr_items_data,
> +		.aggr_mask =3D MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> +		.mask =3D MLXPLAT_CPLD_PWR_MASK,
> +		.count =3D ARRAY_SIZE(mlxplat_mlxcpld_dgx_pwr_items_data),
> +		.inversed =3D 0,
> +		.health =3D false,
> +	},
> +	{
> +		.data =3D mlxplat_mlxcpld_default_ng_fan_items_data,
> +		.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> +		.mask =3D MLXPLAT_CPLD_FAN_NG_MASK,
> +		.count =3D ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
> +		.inversed =3D 1,
> +		.health =3D false,
> +	},
> +	{
> +		.data =3D mlxplat_mlxcpld_default_asic_items_data,
> +		.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> +		.mask =3D MLXPLAT_CPLD_ASIC_MASK,
> +		.count =3D ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> +		.inversed =3D 0,
> +		.health =3D true,
> +	},
> +};
> +
>  static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] =3D {
>  	{
>  		.data =3D mlxplat_mlxcpld_default_ng_psu_items_data,
> @@ -1450,6 +1508,16 @@ struct mlxreg_core_hotplug_platform_data mlxplat_m=
lxcpld_ext_data =3D {
>  	.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW |=20
> MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,  };
> =20
> +static
> +struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_dgx_ext_data =
=3D {
> +	.items =3D mlxplat_mlxcpld_ext_dgx_items,
> +	.count =3D ARRAY_SIZE(mlxplat_mlxcpld_ext_dgx_items),
> +	.cell =3D MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> +	.mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
> +	.cell_low =3D MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> +	.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW |=20
> +MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2, };
> +
>  static
>  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data =3D =
{
>  	.items =3D mlxplat_mlxcpld_ng800_items, @@ -4625,6 +4693,359 @@ static=
=20
> struct mlxreg_core_platform_data mlxplat_default_ng_regs_io_data =3D {
>  		.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_default_ng_regs_io_data),
>  };
> =20
> +/* Platform register access for next generation systems families data=20
> +*/ static struct mlxreg_core_data mlxplat_mlxcpld_dgx_ng_regs_io_data[] =
=3D {
> +	{
> +		.label =3D "cpld1_version",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
> +		.bit =3D GENMASK(7, 0),

This include too is missing but it will be the same as for BIT().

--
 i.

> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "cpld2_version",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "cpld3_version",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "cpld4_version",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "cpld1_pn",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
> +		.bit =3D GENMASK(15, 0),
> +		.mode =3D 0444,
> +		.regnum =3D 2,
> +	},
> +	{
> +		.label =3D "cpld2_pn",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET,
> +		.bit =3D GENMASK(15, 0),
> +		.mode =3D 0444,
> +		.regnum =3D 2,
> +	},
> +	{
> +		.label =3D "cpld3_pn",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET,
> +		.bit =3D GENMASK(15, 0),
> +		.mode =3D 0444,
> +		.regnum =3D 2,
> +	},
> +	{
> +		.label =3D "cpld4_pn",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET,
> +		.bit =3D GENMASK(15, 0),
> +		.mode =3D 0444,
> +		.regnum =3D 2,
> +	},
> +	{
> +		.label =3D "cpld1_version_min",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "cpld2_version_min",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "cpld3_version_min",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "cpld4_version_min",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "asic_reset",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(3),
> +		.mode =3D 0200,
> +	},
> +	{
> +		.label =3D "reset_long_pb",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_short_pb",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(1),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_aux_pwr_or_ref",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(2),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_swb_dc_dc_pwr_fail",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(3),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_from_asic",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(5),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_swb_wd",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(6),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_asic_thermal",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(7),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_sw_reset",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_comex_pwr_fail",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(3),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_platform",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(4),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_soc",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(5),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_comex_wd",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(6),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_system",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(1),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_sw_pwr_off",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(2),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_comex_thermal",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(3),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_reload_bios",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(5),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "reset_pdb_pwr_fail",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(6),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "pdb_reset_stby",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(0),
> +		.mode =3D 0200,
> +	},
> +	{
> +		.label =3D "pwr_cycle",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(2),
> +		.mode =3D 0200,
> +	},
> +	{
> +		.label =3D "pwr_down",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(3),
> +		.mode =3D 0200,
> +	},
> +	{
> +		.label =3D "deep_pwr_cycle",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(5),
> +		.mode =3D 0200,
> +	},
> +	{
> +		.label =3D "latch_reset",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(6),
> +		.mode =3D 0200,
> +	},
> +	{
> +		.label =3D "jtag_cap",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET,
> +		.mask =3D MLXPLAT_CPLD_FU_CAP_MASK,
> +		.bit =3D 1,
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "jtag_enable",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(4),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "dbg1",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "dbg2",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "dbg3",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "dbg4",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "asic_health",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> +		.mask =3D MLXPLAT_CPLD_ASIC_MASK,
> +		.bit =3D 1,
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "fan_dir",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "bios_safe_mode",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(4),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "bios_active_image",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(5),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "bios_auth_fail",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(6),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "bios_upgrade_fail",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(7),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "voltreg_update_status",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
> +		.mask =3D MLXPLAT_CPLD_VOLTREG_UPD_MASK,
> +		.bit =3D 5,
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "pwr_converter_prog_en",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(0),
> +		.mode =3D 0644,
> +		.secured =3D 1,
> +	},
> +	{
> +		.label =3D "vpd_wp",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(3),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "pcie_asic_reset_dis",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(4),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "shutdown_unlock",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> +		.mask =3D GENMASK(7, 0) & ~BIT(5),
> +		.mode =3D 0644,
> +	},
> +	{
> +		.label =3D "config1",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "config2",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "config3",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +	{
> +		.label =3D "ufm_version",
> +		.reg =3D MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
> +		.bit =3D GENMASK(7, 0),
> +		.mode =3D 0444,
> +	},
> +};
> +
> +static struct mlxreg_core_platform_data mlxplat_dgx_ng_regs_io_data =3D =
{
> +		.data =3D mlxplat_mlxcpld_dgx_ng_regs_io_data,
> +		.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_dgx_ng_regs_io_data),
> +};
> +
>  /* Platform register access for modular systems families data */ =20
> static struct mlxreg_core_data mlxplat_mlxcpld_modular_regs_io_data[] =3D=
 {
>  	{
> @@ -7239,6 +7660,32 @@ static int __init mlxplat_dmi_ng400_matched(const =
struct dmi_system_id *dmi)
>  	return mlxplat_register_platform_device();
>  }
> =20
> +static int __init mlxplat_dmi_ng400_dgx_matched(const struct=20
> +dmi_system_id *dmi) {
> +	int i;
> +
> +	mlxplat_max_adap_num =3D MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
> +	mlxplat_mux_num =3D ARRAY_SIZE(mlxplat_default_mux_data);
> +	mlxplat_mux_data =3D mlxplat_default_mux_data;
> +	for (i =3D 0; i < mlxplat_mux_num; i++) {
> +		mlxplat_mux_data[i].values =3D mlxplat_msn21xx_channels;
> +		mlxplat_mux_data[i].n_values =3D
> +				ARRAY_SIZE(mlxplat_msn21xx_channels);
> +	}
> +	mlxplat_hotplug =3D &mlxplat_mlxcpld_dgx_ext_data;
> +	mlxplat_hotplug->deferred_nr =3D
> +		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
> +	mlxplat_led =3D &mlxplat_default_ng_led_data;
> +	mlxplat_regs_io =3D &mlxplat_dgx_ng_regs_io_data;
> +	mlxplat_fan =3D &mlxplat_default_fan_data;
> +	for (i =3D 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
> +		mlxplat_wd_data[i] =3D &mlxplat_mlxcpld_wd_set_type2[i];
> +	mlxplat_i2c =3D &mlxplat_mlxcpld_i2c_ng_data;
> +	mlxplat_regmap_config =3D &mlxplat_mlxcpld_regmap_config_ng400;
> +
> +	return mlxplat_register_platform_device();
> +}
> +
>  static int __init mlxplat_dmi_modular_matched(const struct=20
> dmi_system_id *dmi)  {
>  	int i;
> @@ -7458,6 +7905,13 @@ static const struct dmi_system_id mlxplat_dmi_tabl=
e[] __initconst =3D {
>  			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI142"),
>  		},
>  	},
> +	{
> +		.callback =3D mlxplat_dmi_ng400_dgx_matched,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_NAME, "VMOD0010"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI173"),
> +		},
> +	},
>  	{
>  		.callback =3D mlxplat_dmi_ng400_matched,
>  		.matches =3D {
>=20
