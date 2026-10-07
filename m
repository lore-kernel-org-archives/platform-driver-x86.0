Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazolkn19012062.outbound.protection.outlook.com [52.103.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D73F6C58;
	Wed,  7 Oct 2026 06:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353727; cv=fail; b=DQ7UOLN6exTEgRVRydWHq64dGF2h9VypOpYCzLWc4vurW05Cfr1u0wQmRgmZqE250d6Gqe6PobrjZQEmFIgE1K7x+1vZar1xm1ddHN8uQfghu5c8JAbwlhSu9Sb7Xwc2kfMzvYiABKEJ9KRUd1Z/thWcQAATagcuBaFYFCnDJHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353727; c=relaxed/simple;
	bh=wLroAKA6ySn6/sPN0HYldZYb6NWgsBtBeDIiY1L+Hkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FZZSDzP3eJVhbD4EJfPS6wpVB7bMwrh1iCDK6Rcp7Qp7bL0CORDG2QlaRA8We0ttSv3reAu3u56D+FCPDY5WMwzoRCF+KjYxFiz/Ps+IOB2f8/n9dyyuphF5GYCkNag1w+H86JOnvKFPTsmqR+vP5hmeoGqlnFz/flmEHiNRCmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=TaWraGBL; arc=fail smtp.client-ip=52.103.43.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="TaWraGBL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDhQscvXTZWjWuKZWSWA0BwGIB0zpSK8VNRYzbxkHu3td9HX7/yB7RE7Ol8RAAzYa9oz5cOCvTrd0GGIAP2aHv+1eiMtEUrc6LV3UiTG7GXCogQKEQO5lfC/JN/BMr3DmI+7N1sPmXrbzaQXhAyNS3ysfaD1agjelQDZCZUQ9wE3ZlB7pdOaEePVWtd5rHRxmEE46VZJzUCn3KYwN9dMTmm5CBLJf0BJE0AGfRXGN1MXnzZCJqUQ4i/qiB6GY3SFP7netG+a9K7QMtY+Ut3X/8h3g6OPeZoEGbNPsc9YNRKr4Vm9J6ZHGM/D1pdv8bVHai5sZ9ikSfD3ktSbZRS/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLroAKA6ySn6/sPN0HYldZYb6NWgsBtBeDIiY1L+Hkc=;
 b=mCdrUznXTYZE/aGPV+IdUQHdXMuY8zIaj/fcHV7x5Efn/9Omedv82wmdE8qcXcUMr7mYiItfAah0yLxdAHiETeCSfSSJ11pXrLbSdRvaY3KIF7GHdX88FYwmiIorK1zL56ynSpJruCDhH/oEdzKiNC4wqoRWFKcW8KsOQdJ0DeMICGko3xuPilTzPLsjHtYJiUecYeLDmDeMUGjs2p7YwS/nRpOHZQussWMTQwHWAJQ6pzuEvz4GnW1UpKdFmhItelH99qqWnRnPYwvX7OL4KhMgHQlKHi/+oc+txPLzKL0ic/lKrvdwUZH9dscKU9Rk7hTkc6vQjbgBH5MPNpV8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLroAKA6ySn6/sPN0HYldZYb6NWgsBtBeDIiY1L+Hkc=;
 b=TaWraGBLvx7ecsWSNG4Ep1G6PvjvH+nUVr0sjsOLI6LJKu2nRNR0aw6QLPtIHo8WCQhed7/8mMpMNFL+z9Dp1IuKSw5l9tti5ZjhSqGDDFFJNy0ay69enlstx+hLPn/Nj86dIUK8PuFaQ2mNzaBsDsKDHYCo9yIdBqF0SoZD8RLuGa2mWwiYCKnTOJc0cIUeujmooVjrzYxevUHbfMsTY/+NjOAy71E7rJ5xBBh/jRlHIWA+bmXkrLLY8Xy04jrmaiJ21Hcf9TT9/yXshEOAoPXNJ6agXDMYIwZ18Q7CsLXb2UOlhqqNGODD3OxZ9nREvtUiJ5pNMo4peaipq7246Q==
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com (2603:1096:4:1eb::6) by
 TY0PR04MB6206.apcprd04.prod.outlook.com (2603:1096:400:32c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 06:15:20 +0000
Received: from SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9]) by SI2PR04MB5895.apcprd04.prod.outlook.com
 ([fe80::eca5:8fa:ae90:10b9%3]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 06:15:20 +0000
From: Shuwen Bao <baoshuwen2013@outlook.com>
To: Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
 Emre Cecanpunar <emreleno@gmail.com>,
 Suryansh Singh <technosfan14@gmail.com>,
 Radhey Kalra <radheykalra901@gmail.com>,
 =?UTF-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
Date: Wed, 07 Oct 2026 14:15:03 +0800
Message-ID:
 <SI2PR04MB58958F552F0DDCC81D90CD41A2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
In-Reply-To: <179122230394.27048.9839062081057759183.b4-ty@b4>
References:
 <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
 <179122230394.27048.9839062081057759183.b4-ty@b4>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To SI2PR04MB5895.apcprd04.prod.outlook.com
 (2603:1096:4:1eb::6)
X-Microsoft-Original-Message-ID: <8199519.EvYhyI6sBW@supercomputer>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR04MB5895:EE_|TY0PR04MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: a1350e94-b83f-4a83-eb58-08df243a5d16
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|6090799003|23021999003|5072599009|25031999004|22091999003|24021099003|25010399006|19110799012|8060799015|4302099013|440099028|3412199025|1602099012|40105399003|2607281247196008|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjlvSXNrK3dlUGxqRnRVYVM4c3MwTG9uN2pQZFFrY085TkR6REtWSnZVaUlR?=
 =?utf-8?B?bnB0SHo4ZFBaUjh5aDFHRHIrbTRYZ0pWK09TM0k4VW1JZ20yVkh5V3lyaURx?=
 =?utf-8?B?WjVPY0xwU0hHdlVaN1BtM2pkN1JFbXdxQkYwVjdMQk5jaG5xS1hxcnVjRkx6?=
 =?utf-8?B?cERmcXdHTkF2RGxZbWwvOTI2b2JVUGJLWDJoNHY5UG8xMGZhV2Q4ZFpZNDFY?=
 =?utf-8?B?VFRPWkVOTmNEYWoraEczTFp1UWt0ZjJhMGFybllXY21IemdsMW1QK3N0a0dC?=
 =?utf-8?B?SmVld21hRVcraHJCa3lVTVR0MHF4aWYrbEtZMVhZSGtTQm1LOEVXVXlnYzZz?=
 =?utf-8?B?K1VSTEpra1ZQaWpDVVJRQkhyZE5GQWtOb0NmNmowWERTTE51Rnl3L2ZuOExj?=
 =?utf-8?B?UURsZU5pNTUxWGRrY0F6ZHJoanVTSmZkdlZNSFV2OXE3bXBxQmdPNkVzeTRZ?=
 =?utf-8?B?SHNtd0tQUjFOR0ZqMHEvTDNlNjBKQ1FCVnpvZFoyVGt4cm1NdjhJNWNVczFG?=
 =?utf-8?B?ZitNcm1HRG1IK29TUUM2c1dDZjM1eXFFOE5HaThGYUtaNndpVHhxS29RWUgy?=
 =?utf-8?B?SzBpOVFESC9MdTB3Z3FKM3BzQjlMSkRwWXZQVEEvZDdkbFBNdTdsT011c3RQ?=
 =?utf-8?B?LzZGWlJBaWd2WTVPSE9BRXRrUVFTdngvTWpUenkzbEljVU1OUEFJZmxkSXFj?=
 =?utf-8?B?WWl5VTAwWXlibm1KY2h0ZUYybFY5WVdWMnV6QlBQaHptWWJuNGJhcXNxUyt0?=
 =?utf-8?B?ZEc3SHlhMHd5MDN4elRmWlRVOFFjRUZ6aWJnRWsvSi9CQ3kwbFlBSVpVQlBP?=
 =?utf-8?B?TndadWZyOUF1c0FEcHFFRE9HT0xiM2xkYzc3aS80dSttZ0VZbVhnRUVJdWQy?=
 =?utf-8?B?YzR4YWJjRjVrNFU2NXV5NUN1dHFMSkdWbmdFZ0RvRm5XdlpjcVRxZzZ0SjdH?=
 =?utf-8?B?NDNQbVVuYXljNEdJVC9lYzN2S1FLWjB3MlJKZGpIQ2xleG1GZEFxSlpyUnJS?=
 =?utf-8?B?dlg4bUVnTkdTWU9jMzJSd3JwVE1JYVY4aFpoSDNXTVBHSU1KWFJKRzRaM252?=
 =?utf-8?B?cHREOFIxQ2VXZ3pUdmY1dU9RcHVhRzJkTWI1K1F1UGlERzZnbzVRWTNDNEYy?=
 =?utf-8?B?K2hQRlkyRzA5cWFoejRHdG5VdXZ1ejVYWktLMGhreFlNSzV1YjEzcWJHRHpO?=
 =?utf-8?B?T3NKWjJ3VU1scXZDV2FISGplSWl5QkU3d3dDMEIyaE5naTFXQm42SUplMklL?=
 =?utf-8?B?NWlUY21BNWJJU2hsdzg0ckNEaExFdE84ZzhIZTUrNUdVN050b0ExZVJTak9r?=
 =?utf-8?B?WU1iSG1Ta3BWNElnQUlXY2dNVFQyU1hGTWQrb3BrWXBFKy9SR2VqTHNyd2RK?=
 =?utf-8?B?RGNYeTM1YlpyajR1aW16UEZrNnRhNkl3Si9OU2VLQTVjRm51b2hBc0R1aVBm?=
 =?utf-8?B?MnFocW5pTHNrMHE2ZHkzc0VqMmR3YmNqbEtwbC9jSkQ1a1h4bURPRlgrNTJQ?=
 =?utf-8?Q?3WUk6XYDtEQ4sdzGePG7l3CciwW?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHZkeWJzNlE4VzR3T21TN1F2VFBxQ0NmcHdiOStuazQxd2p0RXhJbUpTQ3M0?=
 =?utf-8?B?VHp1MEVqTmdhd2xPNEc0WFV2QnRZczErRWtCRndjbCt6YVEvbE1teXJ3MnF2?=
 =?utf-8?B?b2pUelF0d21qVGhFWmJGNnE1eU9rWTNGaHBnZ3NsZEFnYXVOZEhEVEhCSWdt?=
 =?utf-8?B?T3BtakdYQ0dsY2FaTy9WbWZCUFhQUDd2LzV5UlAvT0grUk1yc3cwMDM3bEUx?=
 =?utf-8?B?NzRWd1RkVGJZUDlhamI5RjQ4MXFlYzdmNi9NWm9NR0o3SGovbVk4QmFkQU04?=
 =?utf-8?B?N0pSWjVva1RUT1V1RURKcER6a3BUSU01RnFaeUl5K3JVWlhJSnFqUmhkcDRl?=
 =?utf-8?B?akVPdjk2akFWYXVIcHE3MVY1Y0lXd3BQdGxIc0xIVDRCODI5VlBDSzNQZWdh?=
 =?utf-8?B?c2hTUmFDSDVpcURhZmVBRG5QZnFMZjFuV2ZMUUs5cnhhL2RiRk45VnhTYUk4?=
 =?utf-8?B?emFrWFdKU3FLSm0vc2ZOQlprUGgvbzc4QWJZbWVXK0pac3ZKeDlHVUJRQmo3?=
 =?utf-8?B?UmRtZEl3cnc2RWFpUmlPZGdNL2ZxZ0VnN2NjQTZlejRRcERDM0hmYVJlbi9j?=
 =?utf-8?B?cHB3RCtRc2JiVEhTbldXTXBDOFY2OHFLc01TclNEcUJTNDNFS3RRazlxaVY4?=
 =?utf-8?B?dE5MWVdPNU9GVnVOOUpvWmVNUHd1Q29aenF6YXNDa0hKOElDM0c3N2xVMDdO?=
 =?utf-8?B?TDM4ME0rSUZtVno4eWRWL1Vad2FGQkkzZ3NJSHo1N1JSRHJYd1ZmZDhHMXBu?=
 =?utf-8?B?UTU3eHg4cHppSHZDUGZ5b0grbVBzZnljK2U0L2d1RWFJZDZjekM4RU15ZUhP?=
 =?utf-8?B?OHRTR1ExdVRxemtkdHN0MkNZUmE1cGUwN3VaeWxxMEI5d0FzeG5XajJIOHVs?=
 =?utf-8?B?cmN3L1NZUk8vVTRUdStmdG1RZVowZk9HV2xrbEFvb2J4cC9EbHZZbXRRSlRa?=
 =?utf-8?B?Z3RSVkxZZ1ZwcEtsbmZ5L25VTFpXR2d4M0h4MXNoR1ZlTHZjaXVPbGpyUWZI?=
 =?utf-8?B?R1AxMXlZc0hLSjhsQXRIVXNUeHhjVHRMTFdKK2RhUU1NVHhsQzZNRUlodCto?=
 =?utf-8?B?NDh2SEJ2QmJxMitxeG5DTXFFZk9YMnFEcjNVZmxieGx4NWw2Y09ESGxoNTFu?=
 =?utf-8?B?ODVDb0tWenhWdlg4Rm1rTUYwV0JzaS9BaFN0N3c2d0JRelpaaENQNXRPREIy?=
 =?utf-8?B?Z0w2d3UvbVh2TFBva2lmVFNjdmd2L3puMElFK2RmNHdYZjEraEM1YkdjOUpo?=
 =?utf-8?B?OTNIdzZDS0RkYlIveUVGaWR2aWVBdE9qUyt3VTQrN1BXSGVXZlZzSkhkSUdn?=
 =?utf-8?B?TVB0TDI3blVGYTZvNzA3c2MzelY2dTlROTYxaUduaUhxYURvU01QYlNsY2lL?=
 =?utf-8?B?Mkc4RXhGZkpHc2xFa2JkeXFTbnUyU0RxU09ZZE1XamNSUG5CbzVZdUN5NVhL?=
 =?utf-8?B?d0o2TkJ0Q2Q3bjRxd2FONWNyQjdtcklWNDdyM2MyTno3dkNKbVVXNm5ucWh0?=
 =?utf-8?B?djhZUEdVM2JSTnpMbEpSamxTRCtQSXQwd1FFTktUeDNlczR4ekJuMFBCM2s3?=
 =?utf-8?B?cUNFcnZ6YTBCZnZwZ0FjbWJMWDdSaW5YNUtxVlZUM2xqWUcxMGtoUG12Sk4z?=
 =?utf-8?B?K1ptSlFaTnRNUEJCL1diTkQvOExRcDZjcFc3SE5kNVIxVHZucFhmTE12NTM3?=
 =?utf-8?B?ZjExTUV0Rkl0RFZUUmNaRGZxdmV4RThtM0M4WHN5TkN6WFRUbzA0dzhOcTYx?=
 =?utf-8?B?RHRod1B0eElRdEJiNjRFRjN5aEgrSm5GLzVBRnNlL1J6UmVGcHkzWU90QUVu?=
 =?utf-8?B?MzdBcTFHb0p6VEhNcXEvVm1tUERnNUpkOXRUREJlUVI1dktTTFNvTDFjQXF5?=
 =?utf-8?B?dFRUSWtZbXYvSFBGcWhrNHY0Vk9KOHBIaDN0SjRhWkhvRWc3VXVHTTJGaG1z?=
 =?utf-8?B?c0xPV1FmT1NLeXBQSUs1eU1xTlBNVEZLYzBKQWgyeUFpaHdpaW1wRkhETUpL?=
 =?utf-8?B?YVNoSzcwcTF3PT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1350e94-b83f-4a83-eb58-08df243a5d16
X-MS-Exchange-CrossTenant-AuthSource: SI2PR04MB5895.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 06:15:20.0996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6206

Hi Ilpo,

Following Krishna's review, I have sent a v3 of this patch which moves
board 8F1C from the thermal profile board list to
hp_wmi_feature_boards[], mapped to omen_v1_legacy_board_params:

https://lore.kernel.org/platform-driver-x86/
SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com/

Since the v2 commit is currently applied in review-ilpo-next, could you
please drop it from that branch and take v3 instead? Otherwise the board
would end up listed in both places.

Sorry for the extra churn, and thanks for your time.

Best regards,
Shuwen Bao


