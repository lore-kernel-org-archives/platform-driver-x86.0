Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA163546FA
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124401; cv=fail; b=A0Q/k+Uj92vFtIDQN8Ufq5F7ezNIQkcBan1ur1oko27Tu3tDx21cBeMizaU8eFxcVlo+JNz1SH7O2P2JRH3X3Cf3syXJVgpUFNBnX7YgwenxJd63Q5hxLutx+irdSRIw80OajpTnRsMVqHQikbutkl44XCQn09ZchhQ9w2NZaL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124401; c=relaxed/simple;
	bh=5o70TAvGzXjcjuSAsfxOqZ+xQ4LC/PsZS+qeNFcq6u8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HtZlgjcqllgdRBIPXm7uupDeYsDb1A+HIVnjg4LYcD2kxFuBVZH3HUvh2TnrzEMkySYqQd/XxFXHQIegYX0EFwkQJTCUAPv7LVEsrZryoA/VIdCT/Nv7cnWE+tUz378Zm/jV2XqnRmVTL6y1dwhI3+aDdRtxNpNq3oX9/ZdwQhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RQy4yYLK; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RQy4yYLK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYdFP66CzfrRXvs5I+f+yjrb9ockHXB/jcPoIrRVvRMSWslcWSJkUnBiUUnFdPFd5LsH3oz4d9p9qME3B+1cNcO41sg8en1phZpu3+RTA8ETIbfhVtrvTk0/KWSiM/o/Ktf8gOx5yfOoptW2enfI0xQH0fkFtg+Ru6DIlc7jl1vmdRanp2sZW2Zq6WtGiCJn2HUW7Gz9MEarxI85hch+AB9fdKoPVuJCwqBi6ErRqKqxuAMZs3atdxZxp17cfdEoZd1Fa8GtCeSWbU7H0qfD6LkI98GVysuVCbWvmCBS+PxBnhAlLN+K18nidCdbpj4jGWIcT7dSp4vcHInrHjYbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o70TAvGzXjcjuSAsfxOqZ+xQ4LC/PsZS+qeNFcq6u8=;
 b=dHGK7rDErXz1f+LTW5YTWmBguCTQs66wZp7xAKhGMwTibyGcay+LpAWmBkRrKGWb91N7Tkg7ZGHQISb5e8DrP3sgdKD4+qPdmNvKbfylYYVIxl92szFnhtsziwDTPWV1DggSgMOEUaFI/BJwK3LcEJfFATA4gkabs4ntsL/yrcz7wK7P/YXjj/1Rn1nF4eOb9k6ndSdXCwobCt8hBbTzHQ9tMpNOn7cdu8kHARsaqjTSX5Qm5aUY5tzfHvAsQ4gIPsc9gyBLEEacS8qK4hXqmmd5wONSkgAQTX85vzt6AKmHXhH3ROSSDR0x3s3AWOUMjYSISbL7b/ad7oNfP4SDGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o70TAvGzXjcjuSAsfxOqZ+xQ4LC/PsZS+qeNFcq6u8=;
 b=RQy4yYLKhMmTILz18z44kuQtTrOlDCCE42hZaTYRDyVlK0JdE5+N7xdFqP/Y5mcu5qFT3XPGLZO5r4EjGbeROSOcQ+sgMZbEX/wRrAed+Nt++2NuQ2QglBPzLv0yGdED5tFmu/KPAK3rxXevjc9Ymhitd7bR9N1Y9E3eX281DjQ=
Received: from DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 14:06:33 +0000
Received: from DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78]) by DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 14:06:33 +0000
From: "Lin, Leo" <Leo.Lin@amd.com>
To: David Rodgers <david@davidrodgers.com>, "superm1@kernel.org"
	<superm1@kernel.org>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: amd_halo_led: writing 0 to brightness bounces to max and clears
 multi_intensity
Thread-Topic: amd_halo_led: writing 0 to brightness bounces to max and clears
 multi_intensity
Thread-Index: AQHdFBy6NpchZXly7EqZIDMXJ2kQtbZulK0W
Date: Wed, 15 Jul 2026 14:06:33 +0000
Message-ID:
 <DS0PR12MB8479028D213B439B7342F3C7FEF82@DS0PR12MB8479.namprd12.prod.outlook.com>
References: <B1A2836A-FAAF-4E5A-8F39-166E51B926C1@davidrodgers.com>
In-Reply-To: <B1A2836A-FAAF-4E5A-8F39-166E51B926C1@davidrodgers.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-15T14:06:32.705Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8479:EE_|DM6PR12MB4203:EE_
x-ms-office365-filtering-correlation-id: 6fb433db-6594-4f6e-1d62-08dee27a469a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|3023799007|18002099003|10067099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 gVnTtuqEO+2Rhly8I4wjkCMnd41+y5Cc42BvRIuxppqlZQG+5l7x+yN+iEBBFQ6Jafu+n/LAD7eLGBByGwYJRjurA5D2uh/h430of43HZIfmx6+wVy3cXqY3vmQgy3bD/7fgQPmFwBOOnOTL6dC+xmT/IILRm7K4Pit1a2oQ1aAl6z4zexDsdViAZPX+9o6V80/AmXxRvggDJDuMGoE7P9JillJjJwCZAZPTu9tjKlnRQDEM+RJVz4qjyMRnbur0ETKCaetw8kbuAnFUyU9q00UGnpsrSIsv8alx/BAMFZQuXbhrMAZNVe/A6s/eRuf7GjZ44d7qFe9zQF/Xg9Skl6SO8HX4BNcRzQFSxIONJmhy8fPWOrNqALCoZ6Kp5khvKuy0sLUJpok7jD3J7Wf8dFZm4y40+G5JnEV5XicO3e4UMcLLZ4TVbWgv6ftDCca49o+5eAYwA6UaGT87BvYdVDoBIldEyQ3Pp922NqZiBXbP72xKWVoSCjkXsR/zXTLg1OIWdc2Qt6ppJ6wG9qsdAL+b+LvsJUCD24AXYPIP0lC9ToAFJc+JQtL0yDXiME3AXUccFpAAhmNSuR5RHetLU3+uSkBEgfFyG+RrIijkwnv0KPz7Slvh6vQCqUvhc6FpROznvWKtq5Xo4qogeEpEiWhG866ucxLsirBu7teeM1clJFkcRTZhysAht33rZG94wnUs0PzrjR++NLlnsbmnn7X5OWBXikvsdFJretI5SsU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(3023799007)(18002099003)(10067099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?UHlVU25nUXB4Vlh5bUZ5bUhlYWJZbWJ6ZHBmcmtNMU9JQTRjK3M0WTZvcG5NaXd0?=
 =?big5?B?Ty9JWVl6Nk52Mk1jbUZacVBuZzlUWWlZeXVnMGhQV05oeEp6aFJ5TGhEMUlHYVVW?=
 =?big5?B?YlZ5ZFRXNjlhWStnai9FcTU1QlRPOWludTN2UElaQ21PaU9MSStXZWpYZGJtNjkr?=
 =?big5?B?cjhPT0Uwa0F4NHF4ZkZjbHprZTN3cGVyTlNNeW10WUNHYWtrNStWV2k0R1MycU9N?=
 =?big5?B?WDk4NXRxOWd3Y2Urdm1hQ2VWZk4vRkxvcVFCOFF1NEUvbyt6NUFma2VOd1I2Vkw4?=
 =?big5?B?dEQ1bEJBbWM2SUxrdWordk1XNGZNZ25vNnRQUE9ucHlSalBpWUxZbVBHNDBiR0xs?=
 =?big5?B?TnVxakVIOVVNL1Rvc2RJMGlmWHVKM3k0VUFZeVFnNFlzcjN0Wk5jWEVLVFc4c0pl?=
 =?big5?B?dFJWdEovcDNtaFNRS0RvUWhCaVRzTFJxOUxKWGlSY2lxV1ZVMGEzYVpRWVVlbFJm?=
 =?big5?B?S0lkQ3lBS0M2dnR6WnVHOE9NdjhvYnlmMmNDNFZXbUEvb1lJSXRYY2hEQWQ5OVdr?=
 =?big5?B?dnJVbG5oYjNJSGFmRFYzaHMzMUJaMUxOTXdrQXpLTjJUb29keVgzL0tUaENueGov?=
 =?big5?B?ckNmTDd6WjZyN0dzTGIva0NFMFlvNjZ0SGFqZVRjUDN1UFpSOWZXTmM4RnVDV3U4?=
 =?big5?B?SGxubUFrRzlDWXk4cHRQSi8zUVJMeWpOdFRHRHliVWsvSzdXM0xHVmVhb1pGWTUx?=
 =?big5?B?UFVQaDZGSFEydElrOFo1Z3hCZ0NKVnZPcEk3NlFNeVMzMnU3eEdLRFZRZWpBc01S?=
 =?big5?B?OTFqVnNCZmNTUUZ5STIvclV0aWtaK0dTY0tEYnFib2NvUHVNUWY2Qk16Vy9makVL?=
 =?big5?B?NjJkcjlYSGt5NEJXWk4ySndaV3hPTEdwRTN3U3V2S1liK3BuSEpjVjFNSStCL0Uw?=
 =?big5?B?UCs4WUorcnVUYzMvNFUzUmFtSmh5emZmdUxvL1FZTFZPSHI4Qlc3WmNCbWFMYW1J?=
 =?big5?B?Qlo0eU9wbk45WW1DbFRrclo0UVV3dWhwWTl6L25wSXo2ZngyQ1Q0VkNmS3lHdkxa?=
 =?big5?B?ZzZqTGwyYUlMcHZWQW5KWVFYOUNvTGgrM1lmekt0M0tsMUFvZVRhVm4xdWtvUWx1?=
 =?big5?B?MnFQazZFVDFnQkQvYTdmOHovNHlYaUxETVc1U3FmZGRzTjkvRk5ER216S24zQktI?=
 =?big5?B?YTZrMjBXdU1XSnFpeWVpQnZGTjdNakRoRzdtMTBQdG1qemlqaGxqcC9RUGdsZThh?=
 =?big5?B?YXNRRWNMQ1RYZDVidU5oREdhRytwMVBsRmdDR1haYjhaVE9LQ1EwNG9SY0JFcmow?=
 =?big5?B?Z2lQRUdQMm96bThxYmY1b1l3VG1uRy9qRTRqM1JUd2Vmd0dDNlQyU2FKUVVraStu?=
 =?big5?B?VVM5TkVBNEhHVUhLaHR0SlJ1dlpMZGRlTmFmMGpuZVhlUlU5YzNZdG1TMzNDa0hV?=
 =?big5?B?SmREVE9iaFBsOG9yS3lNZVpkQ09JMkp1cVV1MUFTYUM1VytqN3ZodXU0V09lZXRQ?=
 =?big5?B?emtwRlk5OTVBcS9nR3FvaFcyYlEyVDZuVVFOajZaaWovUkR3V0xLZ01MSURIT3RV?=
 =?big5?B?VEp0YzhDUU1tK2lwaVhybVZRMFhsOG92L3l4NnF6dDNqQVE5bXV5WUE5Q2tsZzhr?=
 =?big5?B?R3R0cjdQdGg0eUJNZmJpaEpHN0VoL3pFcUFoU05EcmVZRnEzdmoyLzVRaG5tQk1s?=
 =?big5?B?aVVJOVAxUE9lNG9iZUxNb2wrS2dSK0JPYWZ3Tm96MXZWcGdEZkVzcFRZR3V4VHNi?=
 =?big5?B?c05TRkVOMDR2eVQyNlk0U2ozMzRuVDdiczN5bnFzOXVuTlBGSVhtUmhFaEptUXo5?=
 =?big5?B?V2RmZmZncUZPbEU2Y0UrVnE4Sm1OTWRVOXI0eTk3Um5OWmJiMjlBSTFuU2NyTm1O?=
 =?big5?B?RS9CVEFUanlEalhZZk1GMGhWSGpiaFZKVnVZNFZEelBrV2FQZXN0b0ROYmZCYVE4?=
 =?big5?B?NmhlbGwzMERvbDlDUlhoNHIxeUV4dEN3Y3ZNQW5Pb0VqTzczVW1JN3FFaXhwdTEx?=
 =?big5?B?RkprdjBZUzY1bWhZNCtSblVTOUJKYzFDTDQxQ3JFbkhLdUZiRnhjUjNHUE9TQjZ5?=
 =?big5?B?WktzeitmNE9FQ3RRaGFaSE1JeDMvUmFYK2JCZUd4Q2ovdHNFSHM2cnp0SzNpRmRU?=
 =?big5?B?ZXVuUlR1dGZKa0JlNGxMRk5FYXpweVZhMkdmZTZtN0hrUnlGbnNhanJsVUVQTCtz?=
 =?big5?Q?F32PZT9p3dVoyGaozyM8qpV7LQm+q7aA1Y+zgGGlM8wXIbYW?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb433db-6594-4f6e-1d62-08dee27a469a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 14:06:33.1443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uy5BxqT0ITKKjqlk8INx0Eblo1hZQt7UhQzP2+K0g+zqB3q9UaHL4LVYRvcy+vI0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203

SGkgRGF2aWQsCgpUaGFua3MgZm9yIHJlcG9ydGluZyB0aGlzLiBJIGNhbiByZXBybyB0aGlzIHdp
dGggdGhlIFJleCBrZXJuZWwgeW91IHNhaWQsIGFuZCBJIHRoaW5rIEkndmUgaWRlbnRpZmllZCB3
aGVyZSB0aGUgcHJvYmxlbSBpcy4KClRoaXMgc2VlbXMgdG8gc3BlY2lmaWMgdG8gdGhlIExFRCBk
cml2ZXIgd2UgaW5jbHVkZWQgaW4gUmV4IGtlcm5lbCwgYW5kIGRvZXNuJ3Qgc2VlbSB0byBiZSBy
ZXByb2R1Y2libGUgb24gdGhlIHVwc3RyZWFtZWQgb25lLiBJJ20gY3VycmVudGx5IHRyeWluZyB0
byBiYWNrcG9ydCB0aGUgdXBzdHJlYW0gdmVyc2lvbiBvZiB0aGUgTEVEIGRyaXZlciB0byB0aGUg
UmV4IGtlcm5lbCwgYW5kIHRoYXQnbGwgZml4IHRoZSBidWcgeW91J3JlIHNlZWluZyBpbiB0aGUg
bmV4dCB1cGRhdGUuCgpGb3IgdGhlIGNvbnRleHQsIGR1ZSB0byB2YXJpb3VzIHJlYXNvbnMgKGUu
Zy4gQVBJIGNoYW5nZXMgYWNyb3NzIGtlcm5lbCB2ZXJzaW9ucywgcHJvZHVjdCByZWxlYXNlIHRp
bWVsaW5lIGV0Yy4pLCB0aGUgTEVEIGRyaXZlciB3ZSBlbmRlZCB1cCBzaGlwcGluZyB3YXMgZGlm
ZmVyZW50IGZyb20gdGhlIG9uZSB3ZSB1cHN0cmVhbWVkLCBhbmQgdGhpcyBidWcgd2FzIGludHJv
ZHVjZWQgYnkgdGhhdCBnYXAuCgoKPiAKPiAgSGkgTWFyaW8sCj4gCj4gSSBwaWNrZWQgdXAgYSBj
b3VwbGUgb2YgdGhlc2UgoadhaSBoYWxvIGRldiBwbGF0Zm9ybaGoIGRldmljZXMgYW5kIEkndmUg
YmVlbiB1c2luZyB0aGUgYW1kX2hhbG9fbGVkIGRyaXZlciBydW5uaW5nIEFNRCdzIHNoaXBwZWQg
aW1hZ2U6IGtlcm5lbCA2LjE4LjM1K3JleCsyLWFtZDY0LCBCSU9TIDAzLjAzICgyMDI2LTA2LTEw
KS4gSSB0aGluayBJJ3ZlIGhpdCBhIGJ1ZyBpbiB0aGUgYnJpZ2h0bmVzcyBoYW5kbGluZywgYW5k
Cj4gc2luY2UgdGhlIGRyaXZlciBpcyBzdGlsbCB1bmRlciByZXZpZXcgb24gcGxhdGZvcm0tZHJp
dmVyLXg4NiBpdCBzZWVtZWQgd29ydGggcmVwb3J0aW5nIG5vdyByYXRoZXIgdGhhbiBsYXRlci4K
PiAKPiBXcml0aW5nIDAgdG8gL3N5cy9jbGFzcy9sZWRzL2FtZF9oYWxvOm11bHRpY29sb3I6c3Rh
dHVzL2JyaWdodG5lc3MgZG9lcyBub3QgdHVybiB0aGUgTEVEIG9mZi4gVGhlIHZhbHVlIGJvdW5j
ZXMgYmFjayB0byAxMDAgKG1heF9icmlnaHRuZXNzKSwgYW5kIGEgbW9tZW50IGxhdGVyIG11bHRp
X2ludGVuc2l0eSBpcyBhc3luY2hyb25vdXNseSB6ZXJvZWQgdG8gIjAgMCAwIiwgbG9zaW5nIHRo
ZSBjb25maWd1cmVkIGNvbG9yLiBCZWNhdXNlCj4gdGhhdCBzZWNvbmQgc3RlcCBpcyBkZWZlcnJl
ZCwgYW4gaW1tZWRpYXRlIHJlYWQtYmFjayBsb29rcyBjb3JyZWN0IGFuZCB0aGUgcHJvYmxlbSBv
bmx5IHN1cmZhY2VzIG9uIGEgbGF0ZXIgcmVhZCChWCB3aGljaCBtYWtlcyBpdCBlYXN5IHRvIG1p
c3MuIEV2ZXJ5IG90aGVyIGJyaWdodG5lc3MgdmFsdWUgSSB0cmllZCAoMTAwLCA3NSwgNTAsIDEp
IHJvdW5kLXRyaXBzIGNvcnJlY3RseTsgb25seSAwIG1pc2JlaGF2ZXMuIFdyaXRpbmcKPiBtdWx0
aV9pbnRlbnNpdHkgIjAgMCAwIiB0dXJucyB0aGUgTEVEIG9mZiByZWxpYWJseSwgc28gdGhhdCdz
IHRoZSB3b3JrYXJvdW5kIEkndmUgc2V0dGxlZCBvbi4KPiAKPiAgIKJrIFJlcHJvIGZyb20gYSBr
bm93biBzdGF0ZToKPiAgIKJrCj4gICCiayAgICAgIyBzZXQgYSBjb2xvciBhdCBwYXJ0aWFsIGJy
aWdodG5lc3MKPiAgIKJrICAgICAkIHByaW50ZiAnMCAwIDEwMCcgPiBtdWx0aV9pbnRlbnNpdHkK
PiAgIKJrICAgICAkIHByaW50ZiAnNjAnICAgICAgPiBicmlnaHRuZXNzCj4gICCiayAgICAgJCBj
YXQgbXVsdGlfaW50ZW5zaXR5IGJyaWdodG5lc3MKPiAgIKJrICAgICAwIDAgMTAwCj4gICCiayAg
ICAgNjAKPiAgIKJrCj4gICCiayAgICAgIyB3cml0ZSAwIHRvIGJyaWdodG5lc3MgLT4gcmVhZHMg
YmFjayBhcyAxMDAKPiAgIKJrICAgICAkIHByaW50ZiAnMCcgPiBicmlnaHRuZXNzCj4gICCiayAg
ICAgJCBjYXQgbXVsdGlfaW50ZW5zaXR5IGJyaWdodG5lc3MKPiAgIKJrICAgICAwIDAgMTAwCj4g
ICCiayAgICAgMTAwCj4gICCiawo+ICAgomsgICAgICMgbmV4dCBicmlnaHRuZXNzIHdyaXRlIHJl
dmVhbHMgdGhlIGNvbG9yIGhhcyBiZWVuIHdpcGVkCj4gICCiayAgICAgJCBwcmludGYgJzUwJyA+
IGJyaWdodG5lc3MKPiAgIKJrICAgICAkIGNhdCBtdWx0aV9pbnRlbnNpdHkgYnJpZ2h0bmVzcwo+
ICAgomsgICAgIDAgMCAwCj4gICCiayAgICAgNTAKPiAKPiBJIGNhbid0IHRlbGwgZnJvbSB1c2Vy
c3BhY2Ugd2hldGhlciB0aGlzIG9yaWdpbmF0ZXMgaW4gdGhlIGRyaXZlcidzIGJyaWdodG5lc3Mg
cGF0aCBvciBpbiB0aGUgV01JIGZpcm13YXJlIHVuZGVybmVhdGggaXQgoVggZXZlcnl0aGluZyBh
Ym92ZSBpcyBibGFjay1ib3ggb2JzZXJ2YXRpb24gdmlhIHN5c2ZzLiBIYXBweSB0byBydW4gdGVz
dHMgb3IgdHJ5IGEgZGVidWcgcGF0Y2ggaWYgdGhhdCB3b3VsZCBoZWxwLgoKU28gdGhpcyBpcyBh
biBpc3N1ZSBpbiB0aGUgTEVEIGRyaXZlciBpbiB0aGUgUmV4IGtlcm5lbCBzcGVjaWZpY2FsbHku
IEJlaGF2aW9ycyBvZiB0aGUgV01JIGZpcm13YXJlIG9uIHRoZSBzYW1lIEJJT1MgbG9vayBPSyB0
byBtZSBhdCBsZWFzdCBvbiBteSBlbmQuCgo+IAo+IE9uZSB1bnJlbGF0ZWQgcXVlc3Rpb24gd2hp
bGUgSSdtIGhlcmU6IHRoZSBkcml2ZXIgc2hpcHBlZCBvbiB0aGlzIHBsYXRmb3JtIHJlZ2lzdGVy
cyB0aGUgTEVEIGFzIGFtZF9oYWxvOm11bHRpY29sb3I6c3RhdHVzLCB3aGVyZWFzIHRoZSB2ZXJz
aW9uIHBvc3RlZCB0byBwbGF0Zm9ybS1kcml2ZXIteDg2IHVzZXMgYW1kX2hhbG86cmdiOmxpZ2h0
X2Jhci4gSXMgdGhlIG5hbWluZyBleHBlY3RlZCB0byBjb252ZXJnZSBiZWZvcmUgaXQgbGFuZHM/
Cj4gQW55dGhpbmcgaGFyZGNvZGluZyB0aGUgc3lzZnMgcGF0aCB3b3VsZCBuZWVkIHRvIGFjY291
bnQgZm9yIHRoYXQuCgpJIGJlbGlldmUgc2luY2UgdjIgd2UndmUgcmVuYW1lZCB0aGUgc3lzZnMg
cGF0aCB0byBhbWRfaGFsbzptdWx0aWNvbG9yOnN0YXR1cywgYW5kIHRoZSBvbmUgZ290IGFjY2Vw
dGVkIGlzIHY4LCB3aGljaCBhbHNvIHVzZXMgdGhlIHNhbWUgcGF0aC4gU2VlOgoKaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNzA5LWhhbG8tbGVkcy12Mi1wbHVzLXY4LTEtYjM0YzY0
Mjc3MTkzQGFtZC5jb20vCgpCUiwKTGVvCgo+IAo+IFRoYW5rcywKPiAKPiAgRGF2aWQgUm9kZ2Vy
cw==
