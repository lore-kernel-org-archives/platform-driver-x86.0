Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011035.outbound.protection.outlook.com [52.103.39.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC73330B07;
	Thu, 24 Sep 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233592; cv=fail; b=SMShT6GefF1MTHiwwMwAZwm62vZjkBLDgJdpZb/ykFgyzl8Fm9QqRTPgaE3JWnQ5F7PTQ3rwljlWiFJp/X9biDnqxR5O4YL7P3l+D6spJGFXx0eV9iDAwu/lIXlm+DbVnC1cHzbY4A3a1uS/+/P4KIoRcTJDIvvAnrEOuJ0FV7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233592; c=relaxed/simple;
	bh=Rc0hywfZccWaiBoqwXexYml0oiRi+7A+uq6sibzNJOs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r9EZAefZEG0KYTl5+zo8orv+xcCm5TocLxIx0IujnKssyEPuRMBjbop1JPjq/y8KqytPeX3tclIm0gfH+HFl/islS4tazKQ30MCB4t37r8f8E0GowK6Xp5BmfPClfvK6Qq3cUlLjoWh9n+pS7afhKw9HLeNoVDdc5HDAm+kkdnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=u31j+B+i; arc=fail smtp.client-ip=52.103.39.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="u31j+B+i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRpWREFL1c1oSakeyqnBU6+D8NeXr4ZHCCZstWakbdI2iAZj/03CMZU11fdtmlWLmTjzNWAUZSDkOFh+jMX6A0bMa3lx06yijPmn0cYfaUge164Tc3aqZW6k4c0QH43HUx/4mLUatMptu5LCryhbrlUHL83xJOU8dzKFU9LUbImh0rUW37Nv6Y3o9GQkwhvBxE6CvhvlIfSfK5Rno5wH9NiQRvJuidjybb5tPT+zQRG//3/AzNgO4Jw4u+9aQ5LTH4cwj0zFzT2fgGIufDbQ6YnD/Ys42a10j/3RVd8etgMn9nItnGH0f2AlADCJ3IrF2PdJH3YUQpe03JTaxX/RlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc0hywfZccWaiBoqwXexYml0oiRi+7A+uq6sibzNJOs=;
 b=GBWsSdfzVOlMAN+78Nzn1fsxzpaNOkc7KXw6pjC6o1BjuKltoLxpDaI6ggjOGANe6wvG9mtiKqtuKOUubc2zasgTL6JxF6tcXzSIaQE0XT5c8zhOVNDnJ8R4Yuy5I+tad46IZna+9cpsDIgsumRcQTRZ+zTtRVRlLQgFirmrJPzju00EP9VY4xr4LPN1fp3c+hnyumWypccNOmewjggHoOpeFWI+ipCWNIjo/eRyvlAIXM5jjF1CNaVX2lV+TUU+1mnJQLUMHRUmuuYIdQiUrjQ9A5jyTkjmwgVc/ljdr8ZGTr+T5JVF+SytVubZS5yEEprak0DZSZgHR+fCfuY0FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rc0hywfZccWaiBoqwXexYml0oiRi+7A+uq6sibzNJOs=;
 b=u31j+B+iS5Q2kQdqVLXXv1ncYImZazirOjgK3eaZf/Z7mCHe0QRcZKmflNYnh8vn1l7jtHLwJcu3a4QCYjGc0F73Cl+0hvYU9LrN3Nhqfvactb6grciP/Xfu9AR0ZEPYzz7jo32YhZzUKKl3TmDNOHCXSH1vqos5JbgmLyM1COsYh851cRwL+fsLpTiAK9umM9bKlggfU5v1RgFW7qdPNDZvXvypFUYjXedtDPv3B0v0OIQpt3GCXZAF4CYxH0ErVL4hX+Z4MvkZRGsVHG1N2jbmX+u8DFSlGiLjW8s0CUxzn73ewvSEgyD8jkoSIhV2d+NVCSSLutMqzDN3nmGw8g==
Received: from DU0P192MB2938.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:59a::18)
 by GV2P192MB2016.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Thu, 24 Sep
 2026 07:06:20 +0000
Received: from DU0P192MB2938.EURP192.PROD.OUTLOOK.COM
 ([fe80::e7fb:34b2:28d5:999c]) by DU0P192MB2938.EURP192.PROD.OUTLOOK.COM
 ([fe80::e7fb:34b2:28d5:999c%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 07:06:19 +0000
From: Daniel Chadwick <d.chadwick2508@outlook.com>
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: ASUS ROG Flow Z13 GZ302EA OV13B10 support on AMD ISP4
Thread-Topic: ASUS ROG Flow Z13 GZ302EA OV13B10 support on AMD ISP4
Thread-Index: AQHdS/LRHozrWTalV0qBVFKOilWxzg==
Date: Thu, 24 Sep 2026 07:06:19 +0000
Message-ID:
 <DU0P192MB2938FCCF40E122682A04305581812@DU0P192MB2938.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P192MB2938:EE_|GV2P192MB2016:EE_
x-ms-office365-filtering-correlation-id: e6ee7202-3571-478e-6dd2-08df1a0a55a4
x-ms-exchange-slblob-mailprops:
 znQPCv1HvwUXBahuwteIkQeW30lJPuxOlZvQwFS2QWxVtv6+VjOgxDJR874HS6XWZyvFO529pv2EOn5Oje+/tEq4I/J1e/2tp7U8x6CEJcD1IS/Yf/JLbJrBkf+2NEiciakW9n4ujDDvg3QoPpB6PswN5jOiY+7BjiHMBuMUKcLt9dR1oLHNjaPMmFlyOZFQtOKPSz3nv9TlAg+f/Obt8EvQgpJoOcCSjfV7d5BmakS82F3Guefa8zCcT8sKSmjzHraMf6DPVqm4E83CqQ0uL4tYdpHjhXmlB4BgDk9NksKsdpBwOvSTeHYfKEyQFJwFzAcmrKhtuqqXuhjjMe1LW3zo7LyEhabGcLCFqnNt7Tuiyerpng8FVjgxeL1HRATjtNmf0T/eapUlIt4sqwxDHr8EURnuLfQq4L1Beo5ogjbjw1t8nHiaXiMPSP8e8UYCScK1ijvGrN7WBhkQ3OpJTLYwAZDZrpdwUEVqO2rHZ7TMRNGgvf1xbxovr8ptqDXuI14znGwTXTPIFOazKfp/eRVZ9iWJMZEVCpHgcLbM2A55EudHhWskkxoaH2xVjU7VEGnQNC80Z3V4Xe6xmsDGgLaWZldCIkd8v8aLrK3L+X4UkmJGoBcUPrqC+OKdtliFn8zVTWtIQENhO8MqzYaB1ZSL4XOeaugDBk83/3k7wu9bI//Ks6bdzZHTj7hY8uDBqv/KvnI9dOo3FfZ/31UeH2isMuZ/e5We4snPEVELtRiXd2kP2XCIlg/f9JguN3ZBkEVvRfSZk20=
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|8060799015|39105399006|41001999006|31061999003|37011999003|8062599012|4140399003|15080799012|24071999003|25010399006|15030799006|25031999004|20031999006|24021099003|102099032|440099028|3412199025|2607281247196008|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?O6m49vLJyqigYMqzKsFEaWMlsMopp98FU5+mgVPR2/cFTEo/KL4b36xAjg?=
 =?iso-8859-1?Q?YRKIzc66Cy6bTI/tZgAfMSxFnkKhf5bYS9UkHLPKaNreod/elHue8oti/T?=
 =?iso-8859-1?Q?eo1uwAdqfUrXiot7XzcZPtieEjgz0JU5msXH9rUgai27e/+DLA2QUOmivt?=
 =?iso-8859-1?Q?lHpe4y0e29p4m/GXLnlkhCSvy581pFV53h+eCILkv9FyvEjTm63l81wlM/?=
 =?iso-8859-1?Q?9AKptXNTLm6WM3QrkCdy2Ej6Br/sO3nLNH1EB+HjiYOq1ZbJ8dWwgD0NPY?=
 =?iso-8859-1?Q?3a9kmBzun1mCwg29ms5dCXSyonM88YWRtb1eNPj5Og+fFeNZYMlflDTpM8?=
 =?iso-8859-1?Q?1ZfNha1aXy57Yso7j91a3ydlvIHHFB8/H+rV3RF+C+sxWhZeaVu9FBmx65?=
 =?iso-8859-1?Q?E2MVpHn3iTvn4lRFhTaRVoATFBIg54rQT/APR3YZ0MIl46OwvwE2jpIKdI?=
 =?iso-8859-1?Q?GVUUuNiCgdW1iFpw+2SsINZ7bgepgiz++mkTqYnW/OGeh6oKd8eZC1JZ4p?=
 =?iso-8859-1?Q?cOEFOvjl723mwhYVEGozp2XQ2C53SWEP2FupxGbhf1xIbmz3Iu2Cgyvv9k?=
 =?iso-8859-1?Q?SYOIkSsJACBUnBX3PA5ZgnIdt2nhctoKam4XsnRh6Mz1TNtuonjR0sDxpQ?=
 =?iso-8859-1?Q?EkpteXEAqcZzi+DAHgqFvebNuWbSyvQIgGIYls1gJwe6UI9cV8NOc0MI4M?=
 =?iso-8859-1?Q?5bRtUWF+r1FSVgNAy+SdFT9jG8j7EbDPa0d7l8DvBY277n2dU2gf6Qki1n?=
 =?iso-8859-1?Q?z3VFr6Qd9rTts9dMSRMhuy0+n7R5lDBYyBG2ser9hWD9qfexD60haZzHPC?=
 =?iso-8859-1?Q?JSlzY+OG+2bdjYOYX+QCvUmlCwhpabee8wY6ek2c+drViBRT0SlJcZyHOo?=
 =?iso-8859-1?Q?tSadAkWYw2lkFzTF20rdQNe26Awo82XhsVO58kdmjo3wc3Dx5zr+3dXLzj?=
 =?iso-8859-1?Q?KXHUjCEZJ9uv9dqTLUHyckhZoPH2gTxSmeWCxmSjY1l3ID7Cwox7BwMy2A?=
 =?iso-8859-1?Q?9VoydfZNAvKb15LgRxy4sMU8FOA58RKo+Yq3626Oi8zPh+Z8yhFMRjYfJc?=
 =?iso-8859-1?Q?15SQmNkxSpvlbFhIMgHhO5JwS0KQsIGCYAyje1whJDb9MCMMSbZb7pFoxb?=
 =?iso-8859-1?Q?3D4CLYYW4gwPS9Vv4rE6TZbyetZd1mU+WZgojwRdiuaxyAWSLx?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?l9WkDxyQ+FOkQHihKOkTq5oucXXgdnqagEbJB0+YI5fFTOrL8hD49mZO3e?=
 =?iso-8859-1?Q?p2yPf9RpizrjFpsLygxtmneVJ19FdDEJVmycLFee4KmY8nxkSMi1BZait8?=
 =?iso-8859-1?Q?jAzHr2Y/dZ/Iqe9jaXTN7UZy+K1hXOwZuZ8ut0UuJ5Ts5m9nV+NXx5co58?=
 =?iso-8859-1?Q?Dex8uGTrU1Kl232CKUxz/WMACniotEjloq8OTJmO6TuEe6xIm9igmmHjFa?=
 =?iso-8859-1?Q?NlcRIbnys0pJGh++SVkPv27LF8xgTt5lkTsH3i+C7y4RJ+8OLmAq5mgKlo?=
 =?iso-8859-1?Q?0WM6MY6WpU4VylJD0X0pYk5L5c//F8M8wqbMT7bif0Jgv1gMJYJhuv0+QV?=
 =?iso-8859-1?Q?+ADYytzfOGa7zRKHlIUn+En+EaSt7aNnBDHDs8QYoKMRDm7ygPbnia2eRf?=
 =?iso-8859-1?Q?S5u2NQRPgaVUXeZCHHUTEWbPoFFuFwM92Fy7u5OxF4v6siFmjuIAFVSv78?=
 =?iso-8859-1?Q?OO5B6PvaAIIzP7coENE6sJOFWTY2qAQjv4dEp4buT6z+t+DbRULWkqbiuK?=
 =?iso-8859-1?Q?UaUD51Dy42OLRxtiQ/81PtX73VeB/I38uVdzcZ4axh2uO27gac+0b82bTh?=
 =?iso-8859-1?Q?J+GLOWx3hDaDKSF/y1MWhGmoP122GmguQd31kW+m/OJlbMsltPBJmXAuam?=
 =?iso-8859-1?Q?G5L5ESBDaNm+amihzBgpd8AFIxEZpejfHj+Ry6QUxviHJ/CAvk2Lt71opV?=
 =?iso-8859-1?Q?aYQcLSfY9ZitUfQmunrlOPc2dE8Qpm1SocB7EJQGqoOzc9W75/oS6PVDDo?=
 =?iso-8859-1?Q?gRd+S1HDSC4bx9GIDhflSWyS5KD+Q0jrjLPjv/9SPNHyH8IeoHYT6ir0Xo?=
 =?iso-8859-1?Q?CARAhIkj13Zi7XhXTSq90X1uSLe5vUJk2GXsMhMujeEycf8OtXuNrdgySI?=
 =?iso-8859-1?Q?iLzN2l3yvGE17u+2g9LHBGLDb82Z8bFoWWtdpj0zZH97ObpyTBn0zskvSv?=
 =?iso-8859-1?Q?Rm84EYlSmCb9yKHv4DDBx8e+jk11K6ROfEUO0pDIWhRQ/SPPvRclQODfqL?=
 =?iso-8859-1?Q?y8CgBqWu8e+5B4+9QrF8n6fJ9ZJ0DIJ3+iOzocUllMq4/t7OgzljTnQ0+F?=
 =?iso-8859-1?Q?CLU4lEVX9ehGkZwvIriWkWX9MGvLsIIWELe4AAFfVEl8j1uaURUHs5/QzJ?=
 =?iso-8859-1?Q?4+XDSUUqfADzuHAc1VTmCOetJUAD8lSGM5D8yhI90/rVD5h1u4sMpNUVBb?=
 =?iso-8859-1?Q?OIdKrtfZIfqV56FdSYhFKpDO4BRhcKe3VGOX6BVBqwqSRDi1zgCtcRgQ3X?=
 =?iso-8859-1?Q?ClQveskBnLpFq6gBuOyAiQej+cbVIAi4tBt4B+1tX48CRE7MaCHeXYVq31?=
 =?iso-8859-1?Q?6OAudHyp8zDZIPcsStOfDLgszfPXpnXhCuR4NQGcZKJmE+fwNBV8qlaSdt?=
 =?iso-8859-1?Q?Ek1FjL2eO3WyN5MMa+SRvoOrQa1H13xUUd3bNa1Y+aEn0AYTFsxSOGVFPE?=
 =?iso-8859-1?Q?yDk48WbxhikdCRmB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB2938.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ee7202-3571-478e-6dd2-08df1a0a55a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 07:06:19.8668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P192MB2016

Hi Pratap and Bin,=0A=
=0A=
I'm working on enabling the rear camera on an ASUS ROG Flow Z13 GZ302EA (Ry=
zen AI Max+ 395 / Strix Halo) under Linux.=0A=
=0A=
The rear sensor is exposed by ACPI as OMNI13B1 (\_SB_.CAMB / OV13B family).=
 Fedora's current ov13b10 driver already recognises the OMNI13B1 ID, but th=
e sensor remains unbound and no rear ISP4 capture/media graph is created.=
=0A=
=0A=
I've compared the current AMD ISP4 platform configuration with this machine=
 and also analysed ASUS's official GZ302EA Windows camera packages (V11.04.=
02.1159 and V11.04.02.950). Those packages confirm ACPI\OMNI13B1 -> sensorO=
V13B.sys and include an OV13B_3001_ROG_SRX.atb board profile, but the profi=
le's electrical fields are opaque and don't provide enough validated inform=
ation to reproduce the board configuration safely in Linux.=0A=
=0A=
The remaining information I haven't been able to establish reliably is:=0A=
- ISP4 CSI port / lane mapping=0A=
- I2C adapter mapping (the sensor address appears to be 0x10, but I have no=
t treated that as verified)=0A=
- sensor/ISP GPIOs and polarity=0A=
- clock source=0A=
- power rails and sequencing=0A=
- any OV13B10-specific ISP firmware/profile requirements=0A=
=0A=
The existing OV05C10 platform configuration appears to supply this kind of =
information in software because it isn't present in ACPI, and the earlier I=
SP4 review discussion also mentioned the GZ302EA/OV13B10 case.=0A=
=0A=
Would you be able to share the correct GZ302EA/OV13B10 platform configurati=
on, GPIO table, or point me to where these values should come from? I'm hap=
py to implement and test the Linux support and can provide ACPI dumps, the =
ASUS INF/profile metadata, logs, and test results if useful.=0A=
=0A=
I have the physical GZ302EA available for testing, so I can validate patche=
s directly and capture frames once the pipeline is safely instantiated.=0A=
=0A=
Thanks,=0A=
Daniel Chadwick=
