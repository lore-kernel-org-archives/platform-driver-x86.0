Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E6E4A33;
	Sat, 23 May 2026 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779547746; cv=fail; b=Goj6daljz3vfk7HP/6LsUjSTou7uhc2jy+Ltje+Po+nK+FpHUQeDqjDHig7aO2aeLBeLov7odqweEdOIL/GbZl0ARh3XUto7aQP3K+C/FcKfkcjotwSOVOTAoCjHWLDWlnTxsaTzmKRcm90fCvubPqiP/sGc/wX7a+pqvC1IGqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779547746; c=relaxed/simple;
	bh=K9SuGdoVkURaldGCuHpd4X/lpy1Mo2IVEhmt7VhIIBc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=onniAgaWEuu5Ljrzr+W3Bz3ay442UY9y/ih6r9G2X3tJQHFBJ7z77KJtUAJZGqkvQDLEh4kndqXW2/xe4LrhMriMoadDVg9UzFLAdNRqYeKGyYvfwXVMbuhOmPTgmTgiE8+96PWNIBf3sAV1mbsLTmxav7UdnhYdH9RJYkj9Sbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wrO3/NGE; arc=fail smtp.client-ip=52.101.56.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wrO3/NGE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brAZ05Mpkt3nD1HgsgerE6l3CBzV88hjvzUTGJMBhkgCKqZRzyzKGzXvI4jWDvzgIQJKl9XWtItzsx025tmVwV7Ysfp1G6yjnJ/CJR98cbZwL1VM7QpNTAOTZDnFls/CPKDzuuAb6lQs8yGDxMcthJvXmV3s/n+0cjwCmxXIxsbHNVSgLVHKv/mlRmeZyyDuM432Ty5rD4o0CGlMs38zCloBwWpBxXJdbag1im6hf7y7xCjdM7I7beoUffE3en7UN1e6fCP74RSn3RakrGhrUIXikTpuycvWi/qAwHxE5IrfOYquRCnCagprxZ/0g5KkKdDMl1FPHsjTeH7NpQMHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=764k77seRUrjvBbvp62AEMvQuO1HA9m+sj2CMTiPfzA=;
 b=PPwjO0BAQI8ywqyGZCDgyptUCsG3YWtQCg763bK5NUWvcqNp4uTJx/yLIEEoyR5VdWkfU6xUu6RnemqquH129lAVbvOb0gx4mpvHRhv8dsLV1dk/iSF+OPKKbMdDtgRl1D3YfAm3tceOTZQGkJWEaLgDbvKgrdLpLxV7FWmuLQatxVczWRE4U+/uefjRwxIqntzBQc4yvHoUjM3LcJ+aSeDVQqQ2mUHe/xu0RJ98qaOJL5tGnIOgGulOcwJaonARGC4q4PuylxxeJm3nI53+rsWnPXFtex4RD0y1pBIROLeLoi8RPml4b/memVHE0lnWsCA+0C3X2bOIlVdgQxhjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=764k77seRUrjvBbvp62AEMvQuO1HA9m+sj2CMTiPfzA=;
 b=wrO3/NGEOyQiBLfbzpAhc50Egg+Cp+r1/6C0f/LqeN2hLqE7PIIqxX3MmQKMnz48sx4bnPDfj+SPy/SGoF9/M+7No6p1BCRhc2wiMYAe24/AqbQBRxyyaq4KsfEXHTbSPhquy5FNslbn9GT9ytNQr+S8aHtrFamG57UzX8AZe+c=
Received: from DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19)
 by SA5PPF80B25317E.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sat, 23 May
 2026 14:48:59 +0000
Received: from DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78]) by DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78%6]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 14:48:59 +0000
From: "Lin, Leo" <Leo.Lin@amd.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello (AMD)" <superm1@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v4] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Topic: [PATCH v4] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Index: AQHc6QaikqoPX1M+5Uafkag+2SUoQLYalcYAgAEYkEI=
Date: Sat, 23 May 2026 14:48:59 +0000
Message-ID:
 <DS0PR12MB847939E8CED96E1B15259766FE0C2@DS0PR12MB8479.namprd12.prod.outlook.com>
References: <20260521-halo-leds-v2-plus-v4-1-b498bbab36a2@amd.com>
 <6f29aa5b-a1b0-41d7-aee7-ac13b2fe23d4@gmx.de>
In-Reply-To: <6f29aa5b-a1b0-41d7-aee7-ac13b2fe23d4@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-23T14:48:59.069Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8479:EE_|SA5PPF80B25317E:EE_
x-ms-office365-filtering-correlation-id: 15b60a23-ac27-4104-6c3e-08deb8da6c84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|5023799004|4143699003|11063799006|6133799003|18002099003|22082099003|3023799007|38070700021|56012099003;
x-microsoft-antispam-message-info:
 qmTBInhgE0oVHN1ul+G87dAHPlB+JafbUEkU65D3miqBiKl0SQIvzeuAM6eA9k1JFZUbfjxVlxPHY51E/351DYnv92uDGbtOv2UxMhCRmqsTx0YIgk4Doz5Ox6BLCV13PJDHeXV10aS+wt090oaBAkWCmX9HNnLagp9cArTbxZUWfsoEvmEn0QFaV3En92pypb/aVpM7eP9f6Qp81Dc/oOXKvM8J12lsbRmJjGJSMaQ9LRZ+prrOmTTzJaZUHXMSfnwa75l8rHbmx7VD9qedLJ7birOyzLF/Ja9x6DlTJajniqWa7yG0NEaH6M0f19ALoFblftyDyWiaOnBr12CW9ZJAKj1KeKLMRZ3Vuboz6TlqTLJ8qf5vnpNM+6WnsdcTsNLXcRomVSwyfddaVSGoz8A3ZfQxERFtd88NnZjRBSvHH1ps3vWSxQGeSADSzOWvy/VRQaixXAXCbzt8Y34+q6Aevx6qr7J3fK3/qgQ29naMkBCQcQvsRRvt9rPC2AtnjY/CRS6KSfgSFBy42uQ0ogHP/wDmqhtnk9EXEYFOLpbu4MHDQZZ5pja42VqihbKm8UIEsyHjCRhQYMc2Fd751zWTjWT3Sr5sAEN9F27yf38ojmB/5VGwNm9ukBJGQ/E6tp9SNTi9IBAVjpYdh9ev56QptrZZ2v1ZeWRCYV8ulqJ2BmuH0otylxVZcfeb0bOZvBr0hNsJFiNvZr7OzKCXEdQOL5+7Ge5L7Ce1057If4GFLtXdhSufMUMh/8OZZW2i
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(5023799004)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JIcI3cROiuW/b2QVCEkziOJlVrn4hAcLEFV7goD0ZYBP1GMneA3dSSeeMa?=
 =?iso-8859-1?Q?xVTna3+iku0vC0HhYTD42xhtxmjdRApQArsjt7+Sdiieu//bVDk9dMVw4N?=
 =?iso-8859-1?Q?uqk5m1J0WTyz1IjbDkA5wnmjMG5weJGI6uVzh9WZIDKNE83r/CAhY4N2zx?=
 =?iso-8859-1?Q?EnZi+LV6vXx2XHtqs/0eXIbXFqkyG2xtVl/LKvcmsiXg4uMF0SmFydgrvM?=
 =?iso-8859-1?Q?BNm2YzVzhvUKx1qO+MO49nGuj5iOvH08JbNlHEG0U+KEFqeZUrxNZEMz2O?=
 =?iso-8859-1?Q?J3LeYbw385LbiTN97nB/G6MmEFn6SlGMoI/00knAAXlTvWFA30mM34aXO+?=
 =?iso-8859-1?Q?Rc+qpuwbjfJtoLf9cfcffAAsOiiFeYM7lFA/PKlOBHOWdxvFwFGh4L+VLn?=
 =?iso-8859-1?Q?FzlJRUX3Iizk+EohEERMuIzFKLh+gFYJU/b3ETUxO1FD+RCQmgsN6em3C+?=
 =?iso-8859-1?Q?nlNTSjCFF9r2FuEHZqNgCCzh1bAh/l4gWQp4jf7W3xm7jCrdkjU19BYSQZ?=
 =?iso-8859-1?Q?ElHV8/cl1aUxiBXDsih3gjWixG9n7O40oyqSpObvJeLKtLm5bqf4u47RD3?=
 =?iso-8859-1?Q?sy5UBBNoVmfpVqOIlzUbsc4JHPFVhFuAKblUwl0XtWp4TGp4AW3fAs6v1I?=
 =?iso-8859-1?Q?ozwzeTIz3YqVQV/eEZ+8uEzKGUMTvJxBHXTixkth5Egr6WEQdPWvTCIprr?=
 =?iso-8859-1?Q?m+3zNe3uI53Pzv7HngyEBaqtfm18ljtSo6RtGS/Cf3hV5HlXOFGnpOQOmk?=
 =?iso-8859-1?Q?e09J97kkUSHboZpZP3Q5YYtjtwWqfn/igAZWeTz+dkX4+sTVCvN7DtXXAM?=
 =?iso-8859-1?Q?na40K0cHV2zhScnjNi7OgT7j8+e86kJ7bXB9vIZfmc+IRiLQRrrtP0XRXx?=
 =?iso-8859-1?Q?1Sdv2sKTc0dy4CU7uO6WT+XuHZV4YIHlAOfoXH871dP0KyFxPFjTwh6vXb?=
 =?iso-8859-1?Q?XfmlJ8+10vca8i8ztMq6zEwuf0FPICE/jjqtza/UOeeKYHiOdQIeeAyO4L?=
 =?iso-8859-1?Q?sIq/jK9KkRsvFTmqEs0rCdlUNb6tsjn7A4s2aDiREnON8JtdXia5iC5Pf7?=
 =?iso-8859-1?Q?euM47pJNLFbi6uQtXwICvxh3ivAFflXJWfIAGpqwtfAs8RP2L+z84eCc/i?=
 =?iso-8859-1?Q?Aja0xV07z00MrXAgCMX/DCl2u+kSQp/THh5DlvajMuxErtyZcWECXVhY6i?=
 =?iso-8859-1?Q?jb67mdwE713vMDXreSlvT5UomCR9AbqcDDd6PYDVPsiJn5N4I5pKMn3pFQ?=
 =?iso-8859-1?Q?24jU3FxavQQlDTXqs7lzjkwIK8HWjZkLR2H3qCP7NN2OY3un7d9I7xsK+K?=
 =?iso-8859-1?Q?Syv8yaPjs4SWvtY9sKMT4GCDUI/JZ0VYdkC9eIaP8ZFqCHGCFWtt/0dgFY?=
 =?iso-8859-1?Q?GdxB33Uc1I23UDWaUSitbXwkWCnQLMnfJgT9ja/p9DQttAlIaDOfu4/5IQ?=
 =?iso-8859-1?Q?mF3n+hw7XbZ+un80G0w9MsbC8ywjGiayaDly2Gklyr3e4rqoPV4gRzZMWE?=
 =?iso-8859-1?Q?3kdlpJJSQOL79k6/mX0xb7TLT9W98V4virLhI0k3CIl6fDqX0VRfAIzgoR?=
 =?iso-8859-1?Q?4/vU2ZnDDW7CHEFC5LrxKCGmdgjD7INel5btLKv1x/HLnQqrS12M3B3Gi3?=
 =?iso-8859-1?Q?6SuyoPyPeMuXVrnX238o7aDajl+16U62yzKL2lkWN+kPfpibhIBeMqxQZi?=
 =?iso-8859-1?Q?KQTsKIqhYjy0hc/1q3LaYx/NTr755YN39TJrkMLsC9BgII1O0tdAM1/pre?=
 =?iso-8859-1?Q?s5mhY7vpkgTsL6RIMpjO98C0mb2+U3Bu355HMYo8kvNstX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b60a23-ac27-4104-6c3e-08deb8da6c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2026 14:48:59.6080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UWUVMj8r4Pbl4ynOVyoUq/Ny7/7CZdw/VN7AgT7do01xyCZjsrA3xsPCbWV1r92m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF80B25317E

>=0A=
>=0A=
>=0A=
>________________________________________=0A=
>From: Armin Wolf <W_Armin@gmx.de>=0A=
>Sent: Saturday, May 23, 2026 5:42 AM=0A=
>To: Lin, Leo; Hans de Goede; Ilpo J=E4rvinen; Mario Limonciello (AMD)=0A=
>Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org=0A=
>Subject: Re: [PATCH v4] platform/x86/amd: Introduce Halo Box RGB LED drive=
r=0A=
>=0A=
>Am 21.05.26 um 11:45 schrieb Yo-Jung Leo Lin (AMD):=0A=
>=0A=
>> The Halo Box features an RGB LED light bar that can be controlled=0A=
>> through WMI methods to display any color combination.=0A=
>>=0A=
>> The driver exposes the LED through the LED multicolor subsystem,=0A=
>> allowing userspace to control RGB values via sysfs:=0A=
>>    /sys/class/leds/amd_halo:multicolor:status/multi_intensity=0A=
>>    /sys/class/leds/amd_halo:multicolor:status/brightness=0A=
>>=0A=
>> Hardware interface:=0A=
>> - Three separate RGB channels (Red, Green, Blue)=0A=
>> - All 3 channels are configured at once with a single WMI method call=0A=
>> - Value range: 0-100 (matching hardware range directly)=0A=
>>=0A=
>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
>=0A=
>Hi,=0A=
>=0A=
>something is wrong with this email, did you meant to write leo.lin@amd.com=
?=0A=
=0A=
I think I meant to use "Leo.Lin@amd.com", but somehow used the lower case i=
n .gitconfig.=0A=
=0A=
In the next version I'll fix the mail address so that it matches the s-o-b.=
=0A=
=0A=
(This as well as adding the Reviewed-by to the commit message will be the o=
nly changes in the next version.)=0A=
=0A=
>=0A=
>> ---=0A=
>> v3 -> v4=0A=
>> There's a new WMI method we introduced in BIOS for color setting, to=0A=
>> replace the original ones, so in this version:=0A=
>> - Introduce a new "AMD_HALO_WMI_RGB" method ID. This WMI method takes 1=
=0A=
>>    command argument (GET/SET) and 3 RGB values. This method is capable o=
f=0A=
>>    turning on and setting all RGB channels at once in a single call, red=
ucing=0A=
>>    some undesirable visual effects when setting them separately.=0A=
>> - Replace color setting code with this new "AMD_HALO_WMI_RGB" method.=0A=
>> - Remove implementations of unused WMI methods.=0A=
>>=0A=
>> This version also fixes things pointed out in the previous version:=0A=
>> - Explicltly specify the endianess of WMI arguments as __le32, and use=
=0A=
>>    endian-conversion helpers accordingly.=0A=
>> - Use scope-based cleanup helper for WMI buffer.=0A=
>> - Remove cleanup for channel setting WMI in probe.=0A=
>> - Explicitly include headers for kfree and le16_to_cpu=0A=
>> - Fix white spaces=0A=
>> - Fix designated initializor style=0A=
>> - Link to v3: https://lore.kernel.org/r/20260508-halo-leds-v2-plus-v3-1-=
91df458966ea@amd.com=0A=
>>=0A=
>> (Didn't pull Shyam's Reviewed-by because this is a relatively bigger cha=
nge.)=0A=
>>=0A=
>> v2 -> v3:=0A=
>> - Re-introduce OF/OFF method: implement them with wmidev_invoke_method=
=0A=
>> - Explicitly call the ON method on brightness_set callback for=0A=
>>    brightness !=3D 0; call the OFF method when brightness =3D=3D 0=0A=
>> - Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally=0A=
>> - Replace get_unaligned_le64 with casting and le16_to_cpu()=0A=
>> - Add an inline function (wmi_status_to_err) to convert WMI return=0A=
>>    values to errno=0A=
>> - Use amd_halo_wmi_set_channel in probe to set default color=0A=
>> - Use devm_mutex_init() instead=0A=
>> - Remove unused includes=0A=
>> - Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-=
af027727605b@amd.com=0A=
>>=0A=
>> v1 -> v2:=0A=
>> - Fix Kconfig dependencies=0A=
>> - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=3D0 w=
ith the=0A=
>>    same logic where brightness !=3D 0=0A=
>> - Remove the brightness_get callback, because currently there isn't a=0A=
>>    well-defined global bightness in hardware. Note that the sysfs bright=
ness=0A=
>>    stil works. It just caches the value last set.=0A=
>> - Convert to wmidev_invoke_method()=0A=
>> - Convert to ARRAY_SIZE()=0A=
>> - Convert some macros to enum=0A=
>> - Convert to devm_led_classdev_multicolor_register_ext()=0A=
>> - Rename sysfs path to amd_halo:multicolor:status=0A=
>> - Fold default LED colors setting in probe, before registration=0A=
>> - Add no_singleton option=0A=
>> - Make default RGB values into macros and adjust their values=0A=
>> ---=0A=
>>   MAINTAINERS                             |   7 +=0A=
>>   drivers/platform/x86/amd/Kconfig        |  11 ++=0A=
>>   drivers/platform/x86/amd/Makefile       |   1 +=0A=
>>   drivers/platform/x86/amd/amd_halo_led.c | 267 ++++++++++++++++++++++++=
++++++++=0A=
>>   4 files changed, 286 insertions(+)=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index 8063cb56feef..cde3865addb4 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -1138,6 +1138,13 @@ F:     drivers/char/hw_random/geode-rng.c=0A=
>>   F:  drivers/crypto/geode*=0A=
>>   F:  drivers/video/fbdev/geode/=0A=
>>=0A=
>> +AMD HALO BOX RGB LED DRIVER=0A=
>> +M:   Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> +R:   Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
>> +L:   platform-driver-x86@vger.kernel.org=0A=
>> +S:   Supported=0A=
>> +F:   drivers/platform/x86/amd/amd_halo_led.c=0A=
>> +=0A=
>>   AMD HSMP DRIVER=0A=
>>   M:  Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>=0A=
>>   R:  Carlos Bilbao <carlos.bilbao@kernel.org>=0A=
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig=0A=
>> index b813f9265368..a1a74ef6c859 100644=0A=
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
>>   config AMD_ISP_PLATFORM=0A=
>>       tristate "AMD ISP4 platform driver"=0A=
>>       depends on I2C && X86_64 && ACPI=0A=
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile=0A=
>> index f6ff0c837f34..2f467dbbfc8a 100644=0A=
>> --- a/drivers/platform/x86/amd/Makefile=0A=
>> +++ b/drivers/platform/x86/amd/Makefile=0A=
>> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)               +=3D pmc/=0A=
>>   obj-$(CONFIG_AMD_HSMP)              +=3D hsmp/=0A=
>>   obj-$(CONFIG_AMD_PMF)               +=3D pmf/=0A=
>>   obj-$(CONFIG_AMD_WBRF)              +=3D wbrf.o=0A=
>> +obj-$(CONFIG_AMD_HALO_LED)   +=3D amd_halo_led.o=0A=
>>   obj-$(CONFIG_AMD_ISP_PLATFORM)      +=3D amd_isp4.o=0A=
>>   obj-$(CONFIG_AMD_HFI)               +=3D hfi/=0A=
>> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/=
x86/amd/amd_halo_led.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..f9ee6368f8ea=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/platform/x86/amd/amd_halo_led.c=0A=
>> @@ -0,0 +1,267 @@=0A=
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
>> +#include <linux/led-class-multicolor.h>=0A=
>> +#include <linux/leds.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/mutex.h>=0A=
>> +#include <linux/wmi.h>=0A=
>> +#include <linux/byteorder/generic.h>=0A=
>> +#include <linux/slab.h>=0A=
>> +=0A=
>> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"=0A=
>> +=0A=
>> +/* WMI method IDs from MOF */=0A=
>> +enum {=0A=
>> +     AMD_HALO_WMI_TURN_OFF =3D 0x04,=0A=
>> +     AMD_HALO_WMI_RGB =3D 0x07=0A=
>> +};=0A=
>> +=0A=
>> +/* Arg0 of the AMD_HALO_WMI_RGB Method */=0A=
>> +enum {=0A=
>> +     AMD_HALO_RGB_CMD_GET,=0A=
>> +     AMD_HALO_RGB_CMD_SET=0A=
>> +};=0A=
>> +=0A=
>> +/* Status codes from spec */=0A=
>> +#define AMD_HALO_STATUS_SUCCESS              0x0000=0A=
>> +#define AMD_HALO_STATUS_INVALID_PARAM        0xFFFD=0A=
>> +=0A=
>> +/* Brightness uses 0-100 range */=0A=
>> +#define AMD_HALO_MAX_HW_BRIGHTNESS   100=0A=
>> +=0A=
>> +/* Default RGB brightness */=0A=
>> +#define AMD_HALO_DEFAULT_RED         50=0A=
>> +#define AMD_HALO_DEFAULT_GREEN               30=0A=
>> +#define AMD_HALO_DEFAULT_BLUE                30=0A=
>> +=0A=
>> +/**=0A=
>> + * struct amd_halo_led_data - Driver private data=0A=
>> + * @wdev: WMI device pointer=0A=
>> + * @led_mc: LED multicolor class device=0A=
>> + * @subled_info: RGB channel information=0A=
>> + * @lock: Mutex to protect WMI calls=0A=
>> + */=0A=
>> +struct amd_halo_led_data {=0A=
>> +     struct wmi_device *wdev;=0A=
>> +     struct led_classdev_mc led_mc;=0A=
>> +     struct mc_subled subled_info[3];=0A=
>> +     struct mutex lock;      /* Protects WMI method calls */=0A=
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
>> +     __le16 *result_status __free(kfree) =3D NULL;=0A=
>> +     struct wmi_buffer output =3D {};=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     ret =3D wmidev_invoke_method(wdev, 0, method_id,=0A=
>> +                                &input, &output, sizeof(*result_status)=
);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     /* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) *=
/=0A=
>> +     result_status =3D output.data;=0A=
>> +     ret =3D wmi_status_to_err(le16_to_cpu(*result_status));=0A=
>> +=0A=
>> +     return ret;=0A=
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
>> +     if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         g > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         b > AMD_HALO_MAX_HW_BRIGHTNESS) {=0A=
>> +             return -EINVAL;=0A=
>> +     }=0A=
>> +=0A=
>> +     struct amd_halo_wmi_args_rgb args =3D {=0A=
>> +             .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_SET),=0A=
>> +             .red =3D cpu_to_le32(r),=0A=
>> +             .green =3D cpu_to_le32(g),=0A=
>> +             .blue =3D cpu_to_le32(b)=0A=
>> +     };=0A=
>> +=0A=
>> +     return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(a=
rgs));=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_brightness_set - Set LED brightness and color=0A=
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
>=0A=
>With the new WMI method the fallback is IMHO not necessary anymore, but i =
leave this up=0A=
>to you.=0A=
=0A=
I'll keep this for now then.=0A=
=0A=
>=0A=
>Other than that:=0A=
>Reviewed-by: Armin Wolf <W_Armin@gmx.de>=0A=
=0A=
Much appreciated for your review!=0A=
=0A=
BR,=0A=
Leo=0A=
=0A=
>=0A=
>> +=0A=
>> +     return ret;=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_probe - Driver probe function=0A=
>> + * @wdev: WMI device=0A=
>> + * @context: Context data (unused)=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)=
=0A=
>> +{=0A=
>> +     struct led_init_data led_init_data =3D {=0A=
>> +             .devicename =3D "amd_halo",=0A=
>> +             .default_label =3D "multicolor:" LED_FUNCTION_STATUS,=0A=
>> +             .devname_mandatory =3D true,=0A=
>> +     };=0A=
>> +     struct amd_halo_led_data *data;=0A=
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
>> +     data->subled_info[0].intensity =3D AMD_HALO_DEFAULT_RED;=0A=
>> +     data->subled_info[1].intensity =3D AMD_HALO_DEFAULT_GREEN;=0A=
>> +     data->subled_info[2].intensity =3D AMD_HALO_DEFAULT_BLUE;=0A=
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
>> +     ret =3D amd_halo_wmi_set_rgb(wdev, AMD_HALO_DEFAULT_RED, AMD_HALO_=
DEFAULT_GREEN,=0A=
>> +                                AMD_HALO_DEFAULT_BLUE);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
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
>> base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0=0A=
>> change-id: 20260429-halo-leds-v2-plus-722c8083afe8=0A=
>>=0A=
>> Best regards,=0A=
>=
