Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F820273D8F;
	Thu,  9 Jul 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603092; cv=fail; b=HQCylT8irWipvrD1e+ibuijFY/cKZuDQygRUIGqxcemOQmfiIsLxltEIAYiRt9mbUHovNujwY+f941y8h5Z/n8f9uADfpZSSJs3ST1yOlNvAcGO2/n/ZArSEN2LX7QSOWIKaur2Akkbo6JRSKIYUjYu/4ky6lvIlvIv3wyUTXO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603092; c=relaxed/simple;
	bh=+f6mBsNB6vtrxUI95wtkfhGxcBLBFRBuU8ngYUss5/w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=odeJLTVMuqTeUc9SpEK0zM+dtreIXdtHujG3Kn6DndAxQuT5riwSwUNO61dx1UbvkJw7HvhopmiaLngVUeRCv0zhMHhcugl7oWnhAO9tDxeTrvh/H5AOzHaZ0jr+jXpfB0bFuU7vmmmqh0lRasXohRFMqvf89In69vkCSFm1c3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IX6UmjRE; arc=fail smtp.client-ip=52.101.53.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IX6UmjRE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqsUOLWUFN4b26Fp5uN9bACdJXPN4VlPSYJcqvTF/rJLRHnTMalMqT7Odpr/TIb5yrlS8KrDulJLcsyOLOP+8QH3EiPMy9C+Zk6gyxS1lE/M1g8NW8Sls3/Je9RoqHvUXXmIpQzYuqfDBucYWl7NmsUlhUqkrCaUQNvzbHk2R1D2QEKY3odM6k9kW/FELjDY6cuJBpBIgEjnnCGAzDcVmsl5F5tBchdcpUDPduAqwB15GfjKi4BRThZuvxRzFmt3my2vY2/HyxA7lXPONecARUH7tmQzGovJ4JGZsYWHN488LXyN1PX0n0+7eVTn9p6mGrOwkigVGEQLO83fTMBuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKXN+WwZZzSrMoe0mXIRaMX8gAgTY6lFbQmQaqAU73Y=;
 b=EZNg5ekNzpAyI3st73WUmuP2akCTmU94FyX+WzL9gftNL4K51ct0RyMelITUaI08LXFhO1/OvlQI2ubZNlUxeQ0mDGYHpuktty9Sdb7r+sG/970dBXIbWjCVRyOpT0CJYtyLjqyO4NtrGLuS8ECS24cEiGErsGcbEACUO6hWEVxKTCxPg/dMypZBjkBQKYhTHcCF/GutBzmU7YmIpPE/5xexk4N9UPo4zjXlrGOoNKWeKqYUr0YK3F4JuLavC+0HrMgFqRpJBkEJaOA9MKeTfiW341GhfvhtMcueVbeFK87gBg5qu0hCOlrLg5YQekarTlOe+qme/UaG3IOAaLh+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKXN+WwZZzSrMoe0mXIRaMX8gAgTY6lFbQmQaqAU73Y=;
 b=IX6UmjREJngXrx/dECU1aTcCSHCLiUvtYKvjIftXdQm6M+VqjGD5xiA58CmAy+uGgyalRFYTWLTWbVBWHGTx1xZEtDYmMuILxeCU3lSWsZ2qGodVt0a8VVaQqK1zl8LWuMZwhW+oDEGAs3qsuRU5h1bBkYbbSuS+E7DiVSmYLMY=
Received: from DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 13:18:01 +0000
Received: from DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78]) by DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:18:01 +0000
From: "Lin, Leo" <Leo.Lin@amd.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Topic: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Index: AQHdD3B1kTp26/Ar0kyBfjfg9XMPKrZk+7UAgAAqzs0=
Date: Thu, 9 Jul 2026 13:18:01 +0000
Message-ID:
 <DS0PR12MB847916E03E6AEC3B6F91EAB0FEFE2@DS0PR12MB8479.namprd12.prod.outlook.com>
References: <20260709-halo-leds-v2-plus-v8-1-b34c64277193@amd.com>
 <399d5a32-2af4-9cc3-8372-cd39a86952aa@linux.intel.com>
In-Reply-To: <399d5a32-2af4-9cc3-8372-cd39a86952aa@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-09T13:18:00.620Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8479:EE_|PH0PR12MB8174:EE_
x-ms-office365-filtering-correlation-id: dcf9734d-0761-4c8f-a447-08deddbc8066
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003|3023799007|5023799004|38070700021;
x-microsoft-antispam-message-info:
 zizySKiNsAgRihFsr6NIq2LKtPMPQGwMAxOMvr9aqTwhG2gx/RIcm66VMG06IJbBOqeZG7VNAhHqUEz8ieTZr7QrANjCobhYk10keeUaqxwbN3QXVrhk3QjMi1XQELNpL+s5kWmhPkEZmnYTZ1ivJu2iXkT8q1r53GVoROUh5miEEWB2DIdp4ZpFn6yqyfCcaIhBzI7NMkxv5AnK7YWr0ZbEC2nQUHcKfO6AUIQ1xxlsYPvjkquFe/8HLBB8j1vox/pdd+ylitfT2K/tKlazD4WcrPYgl/bQV35hRM1Qz9xaC3trTqSE7NDYprdRvQO5bx7BabJ2Cn3iKu9xMlby7pqom3zQNfpGk1yTXTVCBkf3zB4GUysEe101t5t5wAhxeMOqBB7XBYZw+lGTy4XZ3oBmyxPpxNcwK5l7Y3hpUxtD2jGlARJznkrGjcNvjuKFJMvmmXWxZrTge6d8SUpIj1ohCPj+VA6/siptAxETn87lEBQ+xZPTeAvVqPREWV6jIsc9m7FKrRlDtOW00xbPiBp3PJpT8+a1Sm68YxxDj1BBWX86fxoII1N4s7D0Uwvs4mdl7v4sw7mOx+3L9g6KQcAbUmvI1FQt64wKAUS+vvddb+NI8IB17pyiipobRTqO+9tArHTEvzLR3J0RJABEIk+y2BiE69GVxZTjI+kIdvzXi8WtWytzHksqJw3yYzfuW3xSIcAfQ9AN1hmHvPa6bePuc4jN0l6CRJ+PKGZngQ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003)(3023799007)(5023799004)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?snJcXOLKv1BFLx4s7sTCApdK5nqMcT32Dp8Lw570mRsUJT3xB9YBh76r+/?=
 =?iso-8859-1?Q?9kgFrvWKCXm3PuLVwSo45/zOGzpcO1heEj4Jj6566JG8Jil/rEwe93PdXu?=
 =?iso-8859-1?Q?B0QGZz79wWO+3hh5sb+AbMFxpmXJqN+bf5TCensD3HlLOCpav/cFcKKMM9?=
 =?iso-8859-1?Q?TCt8L1T0ZawQUxW2jdc4sigG5yPlqNWTkUgTnWiHY/5G6tKSAcx2KF2DTB?=
 =?iso-8859-1?Q?B2z/VmOYIjx55bjCtvaXdWY8AjeIybOsETmjD4haUDimb489Y3WrQsfEKU?=
 =?iso-8859-1?Q?szTOHwngtEfcwU801cDamMXXnMFYtlRYV+ZEdQiTdsooA4X1xRAKg9v5tQ?=
 =?iso-8859-1?Q?okKphRNBgVKZBTENJtb3G1HUZP1xwuHYDgz92B7gTRuLJxpg3Bxtorr+2D?=
 =?iso-8859-1?Q?0zvAUK5P4RFPdCVzfWJOSMNOI4Ol0pvVi3YpPAuVOT8fnGXv9dLvzk4iGe?=
 =?iso-8859-1?Q?F94uO/38C5ziVTkVtFPt+jEuZpcXjKg0uIX9AJWZBwwcEL6on4n7Nnpm74?=
 =?iso-8859-1?Q?k+QMJoAKvoEwAf98V1N/CQcVlDBH1quMkYGBeWV2EcxiuWci090Of9U6U1?=
 =?iso-8859-1?Q?k8feNFBFmdOTbp5gT5bfFyKZuq8ZBCKtT27t6VqB6oOv0gMCRoJSr8pikT?=
 =?iso-8859-1?Q?usLWTy+oA0wciQkAnVvEHkMEjq6FvbUrZT1D6P3t2uBJNrtCfGmFrpDE2D?=
 =?iso-8859-1?Q?jz+B2CFC6dH4rI6kOcAs5H3VB73ZVA3vI0Gsi0DcJbx1FQPht70fP4/dEY?=
 =?iso-8859-1?Q?0SOT0G2DXiiPhQgPJBFLk2rAEu9m/2d3wiKfp4fwbUIk7fGZ44MGkBzUqb?=
 =?iso-8859-1?Q?f6BuKRpOUp/w6TA0YYA+LakiCAHIE3WPPlly1yIBXxIps0HmyHwYJ/Uf08?=
 =?iso-8859-1?Q?0E7u3nR1x82hB2XcgToE/Ej0L0d96MEl3pd11CGLQMcDGLVcF3ebgTEVLb?=
 =?iso-8859-1?Q?ZZEpLJghWcHnicX7KVQGWAoLcVTsHyttvlOW+sHxS4r2LI+1Ig4IUNQqgj?=
 =?iso-8859-1?Q?7+9MriPsxmEUK01OSBnGTCEV/E3KE8IuhovQSMgDB/F5+/6xy1HUHRZEvF?=
 =?iso-8859-1?Q?XwLRDbRpKCyUmcC4j4wGu24wMwrsY2bYL9HEIkGhZecSVhD2xrCzEmgxVG?=
 =?iso-8859-1?Q?bOtQh8cjuW0EG+hXjyU+RAd3HQ3plZ326WyPO7XT6q8296JhFfA3gdxdfS?=
 =?iso-8859-1?Q?vIVXE+tTkK+EAG5h/rP3s+M7xrklXvvXQZl/00UPvZU/8hM3P7GlxD0xpv?=
 =?iso-8859-1?Q?oNn2bxx3q/ctDYTwlrrSrZYIrhQPSOg/za5aD6ZV+otwQHyfrNa7LrV83l?=
 =?iso-8859-1?Q?PZQ97CZkn4r1th6TK7es+V2FaP/dOdAiGEDl62dxWpIwvH09fwaW2XaDAq?=
 =?iso-8859-1?Q?YSjytVc+NqYVmD28MOW88JGy6Ojqs9VkLCWJWobd8mjszsBECSbflGgdC2?=
 =?iso-8859-1?Q?Ho6a9mN2dBFUs2KnsoI2MsScwlCHvPYsi/AesIChRCJXpbYpoCcJ/RL+9s?=
 =?iso-8859-1?Q?YhFSb2pVzoX9wchhgwuxxV49HtqRPi6CwZDC4Sxd4IT4GRdLimERkOkNR9?=
 =?iso-8859-1?Q?fJEliTRypLPyiiYT73Mx2FWpCrcxrW7Dyo3W3yosbeQkmCSlO998Qotxox?=
 =?iso-8859-1?Q?r6Uu3ZV97a2GO45vHc3ZTj33Z1Kcv23/NYtiLFZjp/UUzQMCNMHvQIxSMN?=
 =?iso-8859-1?Q?VzKTh+6ovwLnKGdMUBHxwi3EDri34gwaDHgGN6JTqHEUz8bAVeeKvKHbvw?=
 =?iso-8859-1?Q?Dfaf50fH8xhBwpuW+1v/6q7S4wBkhwfxDj79sA3Rm794ZG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf9734d-0761-4c8f-a447-08deddbc8066
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 13:18:01.0844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0sAj2s5s9LhaBDGy1I+fyJZ6WKYsAcoW6M32UEtfYqk3RdgQMfS6veoftXS+A+oO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174

>=0A=
>=0A=
>=0A=
>________________________________________=0A=
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=0A=
>Sent: Thursday, July 9, 2026 6:25 PM=0A=
>To: Lin, Leo=0A=
>Cc: Hans de Goede; Mario Limonciello (AMD); LKML; platform-driver-x86@vger=
.kernel.org; S-k, Shyam-sundar; Armin Wolf=0A=
>Subject: Re: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED drive=
r=0A=
>=0A=
>On Thu, 9 Jul 2026, Yo-Jung Leo Lin (AMD) wrote:=0A=
>=0A=
>> The Halo Box features an RGB LED light bar that can be controlled=0A=
>> through WMI methods to display any color combination.=0A=
>>=0A=
>> The driver exposes the LED through the LED multicolor subsystem,=0A=
>> allowing userspace to control RGB values via sysfs:=0A=
>>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity=0A=
>>   /sys/class/leds/amd_halo:multicolor:status/brightness=0A=
>>=0A=
>> Hardware interface:=0A=
>> - Three separate RGB channels (Red, Green, Blue)=0A=
>> - All 3 channels are configured at once with a single WMI method call=0A=
>> - Value range: 0-100 (matching hardware range directly)=0A=
>>=0A=
>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>=0A=
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>=0A=
>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
>> ---=0A=
>> To: Hans de Goede <hansg@kernel.org>=0A=
>> To: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=0A=
>> To: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> To: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
>> Cc: linux-kernel@vger.kernel.org=0A=
>> Cc: platform-driver-x86@vger.kernel.org=0A=
>>=0A=
>> v7 -> v8=0A=
>> - Move local variables to the beginnign of function. (Ilpo)=0A=
>> - Add trailing commas to enum declaratiion. (Ilpo)=0A=
>> - Fix more white spaces=0A=
>> - Remove redundant comments=0A=
>> - Link to v7: https://lore.kernel.org/r/20260611-halo-leds-v2-plus-v7-1-=
8aad73fccb6b@amd.com=0A=
>>=0A=
>> v6 -> v7=0A=
>> - Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and=0A=
>>   read them on probe.=0A=
>> - Remove hard-coded RGB values.=0A=
>> - Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-1-=
b7bf7b904a16@amd.com=0A=
>>=0A=
>> v5 -> v6=0A=
>> - Add missing includes and sort/group them accordingly=0A=
>> - In __amd_halo_wmi_call, remove some unnecessary intermedaite variable =
assignments=0A=
>> - In __amd_halo_wmi_call, move declaration of pointer managed by scope-b=
ased cleanup=0A=
>>   helpers closer to where it is used=0A=
>> - Add trailing comma to designated initializers=0A=
>> - Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-1-=
497dc9719a18@amd.com=0A=
>> ---=0A=
>>  MAINTAINERS                             |   7 +=0A=
>>  drivers/platform/x86/amd/Kconfig        |  11 ++=0A=
>>  drivers/platform/x86/amd/Makefile       |   1 +=0A=
>>  drivers/platform/x86/amd/amd_halo_led.c | 315 +++++++++++++++++++++++++=
+++++++=0A=
>>  4 files changed, 334 insertions(+)=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index 15011f5752a99..3b774bc8889c5 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -1138,6 +1138,13 @@ F:     drivers/char/hw_random/geode-rng.c=0A=
>>  F:   drivers/crypto/geode*=0A=
>>  F:   drivers/video/fbdev/geode/=0A=
>>=0A=
>> +AMD HALO BOX RGB LED DRIVER=0A=
>> +M:   Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> +R:   Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
>> +L:   platform-driver-x86@vger.kernel.org=0A=
>> +S:   Supported=0A=
>> +F:   drivers/platform/x86/amd/amd_halo_led.c=0A=
>> +=0A=
>>  AMD HSMP DRIVER=0A=
>>  M:   Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>=0A=
>>  R:   Carlos Bilbao <carlos.bilbao@kernel.org>=0A=
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig=0A=
>> index b813f92653686..a1a74ef6c8593 100644=0A=
>> --- a/drivers/platform/x86/amd/Kconfig=0A=
>> +++ b/drivers/platform/x86/amd/Kconfig=0A=
>> @@ -34,6 +34,17 @@ config AMD_WBRF=0A=
>>         This mechanism will only be activated on platforms that advertis=
e a=0A=
>>         need for it.=0A=
>>=0A=
>> +config AMD_HALO_LED=0A=
>> +     tristate "AMD Halo Box RGB LED Driver"=0A=
>> +     depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR=0A=
>> +     help=0A=
>> +       This driver provides RGB LED control for AMD Halo Box devices=0A=
>> +       through the LED multicolor subsystem. The Halo Box light bar can=
=0A=
>> +       be controlled via sysfs to display any RGB color combination.=0A=
>> +=0A=
>> +       To compile this driver as a module, choose M here: the module=0A=
>> +       will be called amd_halo_led.=0A=
>> +=0A=
>>  config AMD_ISP_PLATFORM=0A=
>>       tristate "AMD ISP4 platform driver"=0A=
>>       depends on I2C && X86_64 && ACPI=0A=
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile=0A=
>> index f6ff0c837f345..2f467dbbfc8a3 100644=0A=
>> --- a/drivers/platform/x86/amd/Makefile=0A=
>> +++ b/drivers/platform/x86/amd/Makefile=0A=
>> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)               +=3D pmc/=0A=
>>  obj-$(CONFIG_AMD_HSMP)               +=3D hsmp/=0A=
>>  obj-$(CONFIG_AMD_PMF)                +=3D pmf/=0A=
>>  obj-$(CONFIG_AMD_WBRF)               +=3D wbrf.o=0A=
>> +obj-$(CONFIG_AMD_HALO_LED)   +=3D amd_halo_led.o=0A=
>>  obj-$(CONFIG_AMD_ISP_PLATFORM)       +=3D amd_isp4.o=0A=
>>  obj-$(CONFIG_AMD_HFI)                +=3D hfi/=0A=
>> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/=
x86/amd/amd_halo_led.c=0A=
>> new file mode 100644=0A=
>> index 0000000000000..b21d956c7d96c=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/platform/x86/amd/amd_halo_led.c=0A=
>> @@ -0,0 +1,315 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0=0A=
>> +/*=0A=
>> + * AMD Halo Box RGB LED Driver=0A=
>> + *=0A=
>> + * Copyright (C) 2026 Advanced Micro Devices, Inc.=0A=
>> + *=0A=
>> + * This driver provides RGB LED control for AMD Halo Box devices throug=
h=0A=
>> + * the LED multicolor subsystem. The Halo Box light bar can be controll=
ed=0A=
>> + * via sysfs to display any RGB color combination.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/array_size.h>=0A=
>> +#include <linux/cleanup.h>=0A=
>> +#include <linux/compiler_attributes.h>=0A=
>> +#include <linux/container_of.h>=0A=
>> +#include <linux/dev_printk.h>=0A=
>> +#include <linux/device.h>=0A=
>> +#include <linux/device/devres.h>=0A=
>> +#include <linux/led-class-multicolor.h>=0A=
>> +#include <linux/leds.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/mutex.h>=0A=
>> +#include <linux/slab.h>=0A=
>> +#include <linux/types.h>=0A=
>> +#include <linux/wmi.h>=0A=
>> +=0A=
>> +#include <linux/byteorder/generic.h>=0A=
>> +=0A=
>> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"=0A=
>> +=0A=
>> +/* WMI method IDs from MOF */=0A=
>> +enum {=0A=
>> +     AMD_HALO_WMI_TURN_OFF   =3D 0x04,=0A=
>> +     AMD_HALO_WMI_RGB        =3D 0x07,=0A=
>> +};=0A=
>> +=0A=
>> +/* Arg0 of the AMD_HALO_WMI_RGB Method */=0A=
>> +enum {=0A=
>> +     AMD_HALO_RGB_CMD_GET    =3D 0x0,=0A=
>> +     AMD_HALO_RGB_CMD_SET    =3D 0x1,=0A=
>> +};=0A=
>> +=0A=
>> +/* Status codes from spec */=0A=
>> +#define AMD_HALO_STATUS_SUCCESS              0x0000=0A=
>> +#define AMD_HALO_STATUS_INVALID_PARAM        0xFFFD=0A=
>> +=0A=
>> +/* Brightness uses 0-100 range */=0A=
>> +#define AMD_HALO_MAX_HW_BRIGHTNESS   100=0A=
>> +=0A=
=0A=
Hi Ilpo,=0A=
=0A=
>> +/**=0A=
>> + * struct amd_halo_led_data - Driver private data=0A=
>> + * @wdev: WMI device pointer=0A=
>> + * @led_mc: LED multicolor class device=0A=
>> + * @subled_info: RGB channel information=0A=
>> + * @lock: Mutex to protect WMI calls=0A=
=0A=
Here's the comment for the lock, which basically means the same thing as th=
e removed inline comment.=0A=
=0A=
>> + */=0A=
>> +struct amd_halo_led_data {=0A=
>> +     struct wmi_device *wdev;=0A=
>> +     struct led_classdev_mc led_mc;=0A=
>> +     struct mc_subled subled_info[3];=0A=
>> +     struct mutex lock;=0A=
>=0A=
>Please put the comment back to explain what this lock protects.=0A=
=0A=
There's already kdoc comment in the beginning of this function that explain=
s this, and that's why I removed the inline comment.=0A=
=0A=
BR,=0A=
Leo=0A=
=0A=
>=0A=
>--=0A=
> i.=0A=
>=0A=
>> +};=0A=
>> +=0A=
>> +struct amd_halo_wmi_args {=0A=
>> +     __le32 arg0;=0A=
>> +     __le32 arg1;=0A=
>> +};=0A=
>> +=0A=
>> +struct amd_halo_wmi_args_rgb {=0A=
>> +     __le32 cmd;=0A=
>> +     __le32 red;=0A=
>> +     __le32 green;=0A=
>> +     __le32 blue;=0A=
>> +};=0A=
>> +=0A=
>> +struct amd_halo_wmi_output_rgb {=0A=
>> +     __le16 status;=0A=
>> +     u8 red;=0A=
>> +     u8 green;=0A=
>> +     u8 blue;=0A=
>> +} __packed;=0A=
>> +=0A=
>> +static inline int wmi_status_to_err(u16 status)=0A=
>> +{=0A=
>> +     switch (status) {=0A=
>> +     case AMD_HALO_STATUS_SUCCESS:=0A=
>> +             return 0;=0A=
>> +     case AMD_HALO_STATUS_INVALID_PARAM:=0A=
>> +             return -EINVAL;=0A=
>> +     default:=0A=
>> +             return -EIO;=0A=
>> +     }=0A=
>> +}=0A=
>> +=0A=
>> +static int __amd_halo_wmi_call(struct wmi_device *wdev,=0A=
>> +                            u32 method_id, void *data, size_t length)=
=0A=
>> +{=0A=
>> +     struct wmi_buffer input =3D {=0A=
>> +             .length =3D length,=0A=
>> +             .data =3D data,=0A=
>> +     };=0A=
>> +     struct wmi_buffer output =3D { };=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     /* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) *=
/=0A=
>> +     ret =3D wmidev_invoke_method(wdev, 0, method_id,=0A=
>> +                                &input, &output, sizeof(__le16));=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     __le16 *result_status __free(kfree) =3D output.data;=0A=
>> +=0A=
>> +     return wmi_status_to_err(le16_to_cpu(*result_status));=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_wmi_turn_off - Turn off all LED channels=0A=
>> + * @wdev: WMI device pointer=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)=0A=
>> +{=0A=
>> +     struct amd_halo_wmi_args args =3D { };=0A=
>> +=0A=
>> +     return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, siz=
eof(args));=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_wmi_set_rgb - Set all RGB channels atomically=0A=
>> + * @wdev: WMI device pointer=0A=
>> + * @r: brightness for red channel (0 - 100)=0A=
>> + * @g: brightness for green channel (0 - 100)=0A=
>> + * @b: brightness for blue channel (0 - 100)=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, =
u32 b)=0A=
>> +{=0A=
>> +     struct amd_halo_wmi_args_rgb args =3D {=0A=
>> +             .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_SET),=0A=
>> +             .red =3D cpu_to_le32(r),=0A=
>> +             .green =3D cpu_to_le32(g),=0A=
>> +             .blue =3D cpu_to_le32(b),=0A=
>> +     };=0A=
>> +=0A=
>> +     if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         g > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         b > AMD_HALO_MAX_HW_BRIGHTNESS) {=0A=
>> +             return -EINVAL;=0A=
>> +     }=0A=
>> +=0A=
>> +     return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(a=
rgs));=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_wmi_get_rgb - Get RGB values=0A=
>> + * @wdev: WMI device pointer=0A=
>> + * @r: output buffer for red value=0A=
>> + * @g: output buffer for green value=0A=
>> + * @b: output buffer for blue value=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_wmi_get_rgb(struct wmi_device *wdev, u8 *r, u8 *g, =
u8 *b)=0A=
>> +{=0A=
>> +     struct amd_halo_wmi_args_rgb args =3D {=0A=
>> +             .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_GET),=0A=
>> +     };=0A=
>> +     struct wmi_buffer input =3D {=0A=
>> +             .length =3D sizeof(args),=0A=
>> +             .data =3D &args,=0A=
>> +     };=0A=
>> +     struct wmi_buffer output =3D { };=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     ret =3D wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_RGB,=0A=
>> +                                &input, &output, sizeof(struct amd_halo=
_wmi_output_rgb));=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     struct amd_halo_wmi_output_rgb *data __free(kfree) =3D output.data=
;=0A=
>> +=0A=
>> +     ret =3D wmi_status_to_err(le16_to_cpu(data->status));=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     if (data->red > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         data->green > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         data->blue > AMD_HALO_MAX_HW_BRIGHTNESS) {=0A=
>> +             return -EPROTO;=0A=
>> +     }=0A=
>> +=0A=
>> +     *r =3D data->red;=0A=
>> +     *g =3D data->green;=0A=
>> +     *b =3D data->blue;=0A=
>> +=0A=
>> +     return 0;=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_brightness_set - Set LED brightness=0A=
>> + * @cdev: LED class device=0A=
>> + * @brightness: Brightness value=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_brightness_set(struct led_classdev *cdev,=0A=
>> +                                enum led_brightness brightness)=0A=
>> +{=0A=
>> +     struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);=0A=
>> +     struct amd_halo_led_data *data =3D container_of(mc_cdev,=0A=
>> +                                                   struct amd_halo_led_=
data,=0A=
>> +                                                   led_mc);=0A=
>> +     u32 red_hw, green_hw, blue_hw;=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     guard(mutex)(&data->lock);=0A=
>> +=0A=
>> +     led_mc_calc_color_components(mc_cdev, brightness);=0A=
>> +=0A=
>> +     if (brightness =3D=3D 0)=0A=
>> +             return amd_halo_wmi_turn_off(data->wdev);=0A=
>> +=0A=
>> +     red_hw =3D mc_cdev->subled_info[0].brightness;=0A=
>> +     green_hw =3D mc_cdev->subled_info[1].brightness;=0A=
>> +     blue_hw =3D mc_cdev->subled_info[2].brightness;=0A=
>> +=0A=
>> +     ret =3D amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_hw=
);=0A=
>> +     if (ret)=0A=
>> +             goto out;=0A=
>> +=0A=
>> +     return 0;=0A=
>> +=0A=
>> +out:=0A=
>> +     /*=0A=
>> +      * Consider the light bar non-functional if AMD_HALO_WMI_RGB faile=
d.=0A=
>> +      * Attempt to turn the LED off completely as clean-up.=0A=
>> +      */=0A=
>> +     if (amd_halo_wmi_turn_off(data->wdev))=0A=
>> +             dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED=
 off on cleanup\n");=0A=
>> +=0A=
>> +     return ret;=0A=
>> +}=0A=
>> +=0A=
>> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)=
=0A=
>> +{=0A=
>> +     struct led_init_data led_init_data =3D {=0A=
>> +             .devicename =3D "amd_halo",=0A=
>> +             .default_label =3D "multicolor:" LED_FUNCTION_STATUS,=0A=
>> +             .devname_mandatory =3D true,=0A=
>> +     };=0A=
>> +     struct amd_halo_led_data *data;=0A=
>> +     u8 r, g, b;=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);=0A=
>> +     if (!data)=0A=
>> +             return -ENOMEM;=0A=
>> +=0A=
>> +     ret =3D devm_mutex_init(&wdev->dev, &data->lock);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     data->wdev =3D wdev;=0A=
>> +     dev_set_drvdata(&wdev->dev, data);=0A=
>> +=0A=
>> +     data->subled_info[0].color_index =3D LED_COLOR_ID_RED;=0A=
>> +     data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;=0A=
>> +     data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;=0A=
>> +=0A=
>> +     data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;=
=0A=
>> +     data->led_mc.led_cdev.max_brightness =3D AMD_HALO_MAX_HW_BRIGHTNES=
S;=0A=
>> +     data->led_mc.led_cdev.brightness_set_blocking =3D amd_halo_brightn=
ess_set;=0A=
>> +     data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAI=
N_AT_SHUTDOWN;=0A=
>> +     data->led_mc.num_colors =3D ARRAY_SIZE(data->subled_info);=0A=
>> +     data->led_mc.subled_info =3D data->subled_info;=0A=
>> +=0A=
>> +     ret =3D amd_halo_wmi_get_rgb(wdev, &r, &g, &b);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     data->subled_info[0].intensity =3D r;=0A=
>> +     data->subled_info[1].intensity =3D g;=0A=
>> +     data->subled_info[2].intensity =3D b;=0A=
>> +=0A=
>> +     ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, &dat=
a->led_mc,=0A=
>> +                                                     &led_init_data);=
=0A=
>> +     if (ret)=0A=
>> +             return dev_err_probe(&wdev->dev, ret,=0A=
>> +                                  "Failed to register multicolor LED\n"=
);=0A=
>> +     return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static const struct wmi_device_id amd_halo_id_table[] =3D {=0A=
>> +     { .guid_string =3D AMD_HALO_GUID },=0A=
>> +     { }=0A=
>> +};=0A=
>> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);=0A=
>> +=0A=
>> +static struct wmi_driver amd_halo_driver =3D {=0A=
>> +     .driver =3D {=0A=
>> +             .name =3D "amd_halo_led",=0A=
>> +     },=0A=
>> +     .id_table =3D amd_halo_id_table,=0A=
>> +     .probe =3D amd_halo_probe,=0A=
>> +     .no_singleton =3D true,=0A=
>> +};=0A=
>> +=0A=
>> +module_wmi_driver(amd_halo_driver);=0A=
>> +=0A=
>> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");=0A=
>> +MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");=0A=
>> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");=0A=
>> +MODULE_LICENSE("GPL");=0A=
>>=0A=
>> ---=0A=
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482=0A=
>> change-id: 20260429-halo-leds-v2-plus-722c8083afe8=0A=
>>=0A=
>> Best regards,=0A=
>>=0A=
>=
