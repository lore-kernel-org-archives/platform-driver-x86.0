Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89054F87
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Sep 2024 17:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.129.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557314; cv=fail; b=KTZAmm5In63AVGRQXxcsdY9iVb0kV90xHxnFwhyJAaxLbTQh0sfHXkZikX+iXT79WwEncM/vnIKI8eXndk0WdUJAmml2zdVltgzWHkozMFKrBrXdlOXvI5oVEZhFb4GMGYloc1+upL/NnFcIrPUm5P97+4G6C535yLa9uYtP10w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557314; c=relaxed/simple;
	bh=ZnOZavseYbFddeHH0MjxXOmkrmD2ULsHLSdXZIQYi74=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bWkAzRUMkiEpLu09sm4bvgKVSPGwxg4NKpEVk6Ia6GBtc9zcmuHLmyyOG/UQvb+5Z5Pzqcudr+ZVbNwdSYUWJyZzYT25XtNvrwxRqRDmabA6wDDo/i9iuo/ykOkiMDFDwCdqOjX0E6Pk3KDQVS+Mg0D6nD4hSPTEi62pSR2/ynw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=studentconnectivity.tech; spf=pass smtp.mailfrom=studentconnectivity.tech; arc=fail smtp.client-ip=148.163.129.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=studentconnectivity.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studentconnectivity.tech
X-Virus-Scanned: Proofpoint Essentials engine
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01lp2237.outbound.protection.outlook.com [104.47.74.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id E38FAA80074
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Sep 2024 17:28:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=im1ONs38S7I6b6AGujdPyj5GNHPgpteE27xUyHXIK3lG6nl1V9XR8GQKE+KN2+w3VS+QsXjDdp1qJkkSJWJeMu+rHnDvxdnBIYy9+84GaNG6zS53al6oM/3PMdaocuSyrDpResld3H88UvJN2jfPQkjKmqFJiplvotrxjb61OfXKpvVjxJBX8SynlhurCtFBlVAdCJicrn/TxpRS2WLTINf3d9DQxoO10kDE9TVJtBWtUrJjnFInXwaJb67K2IhWNBdmn/jyH42Vx37XZlzcb7p93TqHVRuTrMy9n71XgNJKGpXtXXz3pxw8yz0LZ4XuS0djwcgXtT6yMrMwfnUUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO0TAV1FHsGZ1C/RigTu8HIN3cC5rYt4KVs0hJHf/XM=;
 b=jPyGh1FymKhCKWghjlWFlcADR5zys+zjlohj4GNoi4+SyCtHrAE46NqbLFf2wrURpIqFV5dMHKAYG7aQ1DC1bfocSeWly8qEuQnMPRXogvMJDbJvX/vXoVXZq4H4JBrqrJQ0/WcXm23skabjJ3SBzUoYABKYgW1TCqKbZLZ2j9cKE1HOfBERL2u1fwKwxFLfDdzTkjCmR+TLmd+7un9sSZuRhYp2H23xM/RxBKD2YWnYWKd8wcS0Wo3btiT27R5InWvsm5LyGF8aY+VLiVGZp9VWTJhvID5JADx3VYbCUPRdm7iOAG8hMPb4jUkC1i94z0ViOshQMcwwdc0zu/wWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studentconnectivity.tech; dmarc=pass action=none
 header.from=studentconnectivity.tech; dkim=pass
 header.d=studentconnectivity.tech; arc=none
Received: from PN0P287MB2953.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:225::22)
 by PN2P287MB0722.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 17:28:20 +0000
Received: from PN0P287MB2953.INDP287.PROD.OUTLOOK.COM
 ([fe80::a4eb:3288:9551:5b39]) by PN0P287MB2953.INDP287.PROD.OUTLOOK.COM
 ([fe80::a4eb:3288:9551:5b39%3]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 17:28:20 +0000
From: Avery Harris <avery.harris@studentconnectivity.tech>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: School Contacts List - 2024
Thread-Topic: Re: School Contacts List - 2024
Thread-Index: Adr/fr+gNETw0Vgb0ESlESB72VkDnQ==
Date: Thu, 5 Sep 2024 17:28:20 +0000
Message-ID:
 <PN0P287MB2953A928C6329CA6D08F6C21E69D2@PN0P287MB2953.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studentconnectivity.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2953:EE_|PN2P287MB0722:EE_
x-ms-office365-filtering-correlation-id: 550e053a-b7b8-4b61-2f3d-08dccdd0233e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3NnLPQN0+nl2IjTTVwKTsXDZKn/ke1vMXTn3JV/rVPY7nGt1Krk+8NrbgVqE?=
 =?us-ascii?Q?9H8eKVvmBv9A5S/Ien/cIEMxuSk+ujOCUFUe/NiRwHcQ/e6Pe0bMwhj9yTei?=
 =?us-ascii?Q?vj4QIKtdFAe+3JVo0dYHSZcVkKDYPmH2fP+5lzsi+qFogOIUCmnZ/knrdFyX?=
 =?us-ascii?Q?r8diGtbJLyADuDTl5AB4K+4EYJPxqGhHWmG4APH+p8hJiiZxxUt4eRA+X0DG?=
 =?us-ascii?Q?7bORcGNVyOU778DmNAqzO7yx7jQo/WqHcWpWRWjGvmgj5Rfn7Yp45CH/B/Z8?=
 =?us-ascii?Q?elb88bh34PXJGEuQU845qWalcRyY514ZtiUetUyiQ0fqDe77bfZzLkIonjhW?=
 =?us-ascii?Q?w5peMp4g6uaCjbi0tEGbBMT1jgl1WJTug5qGNtLHTwWv+IGpyCtmEo5reNwz?=
 =?us-ascii?Q?EYKGd0LSwdOw9vP3JiPrLflt4+ZniKNbbMgenyP8MLT4CQ5gltvWfEMJIg7d?=
 =?us-ascii?Q?NKLnyB9AhJqIiwnYb2CU4Xv39a/63Jh5Qp0HVCGPOgmxtfxh/brJkWsYr4O6?=
 =?us-ascii?Q?ythE3lBPBJgmt0zlcQA1ScubeDVW9EZiDhJKdmQLZ/LAJYZrVMJUni2a/Sic?=
 =?us-ascii?Q?JEE4Mu5tCyL2IUG5t5zBxPfA/S0XLtkbNhOHT6SIzzuhrZAREmGrt89lAVL2?=
 =?us-ascii?Q?6UrjZzDx6c16yOBl8C5VxWP5/kRSkq4C7Oc4x0Ft1QUDkr4broe7FuQI3jYD?=
 =?us-ascii?Q?Q93R9LKbbeMk+/oT8G9reKsSxzTyZREK5OA1ok4xZFzD8UYFzNelnZCvGPEX?=
 =?us-ascii?Q?rnMsiBA25ZHxKc7FJUaBxYWzRzZB9kDY0B/WTqQ7c8rNTZINc3vW1r51quah?=
 =?us-ascii?Q?DAk19k5HmXk520M+jFecfM3MR14OyzIWk2cgJCLJtsnijX2hXSOWPBrGePMu?=
 =?us-ascii?Q?fvOWIxwHF+gS0oPTZrUoUx/5O79F6Xybb9Yos0wmhagVweqRpPD6S6+GsmY+?=
 =?us-ascii?Q?/x1xSvkZnP+O4/NxE5C+KwnwGc4C6gmgRndqumCSVyg046MQN26ilnqbJMWk?=
 =?us-ascii?Q?ALnHtkU1HcxQkWcdkXEcz0VJ6gJFDc2LJxA7DdAurtZG+h4G5viGGnqByhhi?=
 =?us-ascii?Q?jOIpKQRmzI/6dZSRg9oHP/S48d1lbXywrsT3kHqkqz909wtm/DFpwID+nMcZ?=
 =?us-ascii?Q?r6Ko19mD1V0IsJQV3HWzbTUWKE7jpsNbj9TOK0dUlmjciQq/QaryA6n68+uC?=
 =?us-ascii?Q?xSKIzqAugfWEMltpAEIdlR/mVe82/WzKf0mvI/P/KCFR1c4e48qR2DGQS6Lc?=
 =?us-ascii?Q?PqO3XwIGv7XBwuL5mhh4dFAEe16LYdy9/ApCFOxxvJUFNpklKLoGYDDAmxIv?=
 =?us-ascii?Q?rRctR/Ho8bkgB5T/KRnB6JxHU7hw95xuMJB2bgsvnxR6C8wkLCV3ARBUb1jh?=
 =?us-ascii?Q?k5f0EFhZwMVfDPdHyaz1bzOoEgnpldcR12WBooOPAtPd13sbjg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2953.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Rm/elvZiOj+nr1l86bLdBHupDer+GSRIKpLtUuVq5RepId1QRPqORsf5UVKc?=
 =?us-ascii?Q?reVBymndTk/Lv5p42KKEyeJp9UdePNlDyfx8MzXLyv+W4ZTyxvtGEGV4bEQ+?=
 =?us-ascii?Q?Ufnl08+My88XJnLTzSNhJ5QaqCAltILBu5KMDWP2LbJN58kuw29g0mChblyp?=
 =?us-ascii?Q?vgVKn0W8Olm/O1y9BAHsdxxHj/0KUtRKTxGlKCE1bvU8OhZevrndGLTGp7Rd?=
 =?us-ascii?Q?C27GBqMK3akA3f5VOEeEP0dFtxC7qXhxaYka9wLyBKNzyx1VSufw7sZHb0W8?=
 =?us-ascii?Q?Iv25cxnDhUZxAMS+pBLeGXElyolMA3iVGchY5AMZbJBTUumAl5s8POclIKSd?=
 =?us-ascii?Q?QPpm/Lh444onQ+TmbIZIj8TiXmnluRbnIxEo2NKT33ug1rV8PZJstMZBgz5C?=
 =?us-ascii?Q?m6TXx9Ftm9eX8tUbD6ekjai9Ih4daYMfWg7oVGhK6ZKVhUkT9X1OWko2F+oG?=
 =?us-ascii?Q?ieDi6+NJg43AQhfZXaS79VFrNkye8j4ZThcNlvZJh48dxU93GfDXPPpGlk0f?=
 =?us-ascii?Q?iSJrv+zcIcVUDvdxKn0s2f4ONaU/zaUCx6dSPIgWfKQMmSEa1H1vMXIDsDVN?=
 =?us-ascii?Q?+dCqUTSShFs8NXIksyPrrQlhL3vgIpeY+8MySLSnoRC+8FQEOzE+l5NDcCkD?=
 =?us-ascii?Q?ozXGy/AoW+kR+k/EAesSwgEaM0i9xCfasaCWRzA1EDk1+0ETYc9iVQI1Kx2q?=
 =?us-ascii?Q?RCmqvYB5TQpt+KeYa+niuHDdvKJR/rjHWDoinPjVCriia65ETjel4dAol3e2?=
 =?us-ascii?Q?EKB1lF64g9mWguR9rdBmA/rdf66PjaXOQ50S6Eyc96ZkV5ZeiCnspa0RezcF?=
 =?us-ascii?Q?b/ZQcCFrS/+5/DlBP8RyHIrUG3Hmm72zDxyLnH88K4aOICn7ehdfmSAk21nP?=
 =?us-ascii?Q?T5wRlgLUZiW+LgWo/Ek2ksYhBCY5KtgYEQbesY+ZNC9YFUXC6BP0CTM0QX7f?=
 =?us-ascii?Q?AfOiz6s9hU/SgQpYxCN10YanCQdEUAT0OavxlzqfrNNXMTQv/Cif3xxziQfY?=
 =?us-ascii?Q?A6DImLHUHBybJBBsupAZ0xJ8n/F10ASguJtjw2NdagyDVJaZJkvrpsJJJQdH?=
 =?us-ascii?Q?PXvwn6tt1VNixgPRmL2Xt3BSIhu/JhXPt+l2XN//d6PLAJXD1SO6ogx3UY4K?=
 =?us-ascii?Q?VAVynhSS3vUDg4RSrv1lVTSy4lPBFwVj7d9jNKgJl0TZdSMzGfozDOCtDzpX?=
 =?us-ascii?Q?vVgPS45gWYUiuUB0iUWpe3jxgUvoRaNmILyjyVlacdh36aEzlWv3KAgOxDRK?=
 =?us-ascii?Q?MnsO6BEktWeACZZVdtbxbFEBwbfH0Q+aB+k6KfOzulkb7xyG5Mca6zsT1XMv?=
 =?us-ascii?Q?wlCpMo9aOGxQrqmAWnTziaD8JtArN6R43jK3yTZ1zTrna2fbnOFasGDYE1WZ?=
 =?us-ascii?Q?0qOrtLViJPCYSaKsSluIxMTy0IZsDJ/KF9iVtRtiBVtk4R2TVKjAFJyt2tFi?=
 =?us-ascii?Q?7K4b6TeVpFMogiNnAD1k31TeTyI7/m7sPG97I2rwqHgbnfrz40F6d9BckrUT?=
 =?us-ascii?Q?ioU3CO9y1ihP0aVAFMMDzubMGWaT5UueVYXFH7R0Jp5MUiuW0FWm13wB9BWe?=
 =?us-ascii?Q?7zUBjqN2kTd6labrfwE5H6C3YsmXoh9g1X5hal8oWOL20BRNFAsfrnwjIM4c?=
 =?us-ascii?Q?p9uJGQh8NVz2Z+XVXLNigFJ4Vo8wKpI1ArZRVqa0ChskjxO9yOc0J5Sf4avT?=
 =?us-ascii?Q?zhXwxMzbQ0ZepdpMLz97ok195FM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OG6pyFApdv8lwBkHN3Q1Wb/u5m7fMDhK+sPQLTqxnuO5aMtUb3n5jJT1EyFKvSn8fw4GgcVIAzE9WyoljGPe43Qc+WcZPnhnqmgukW2rchdFPixFMFW9HVtp5dopNV0Bo2Nl+riCRyHLcNMSLauCJ6Fx489ySgqM2fNWF1xcsevO+ZaUJA2vQWf/GI2elB4PpGf1iQxz2ZJkoarl6sXc/6vjQqv2w/P5hbohVRnsf1CeyFhpnpRyMsfqtLOsbLSs9IDqA0qYuhWi/Rokr5qAbhbGJAY4IuQ6CeaofUzEzj1un+nayUkyAkPQm9n1MpzQ6Kn8ueb7gbElxwtcSLTjEfOreojQscD6Fo+p+SItp99gWoezJ4JMGE8LpU5c4AeHksCZuFc+OzYBUsVp2txhhwjLFq51Hx4kJ6LjpD3ZapEBMeT0uNXE7kBThyz9EsCTshzjsAKXsDNgrdbrA8v4LBJmNmUIinmeKB4D8qBRV0jEvmSTY1YRBf7sUYv/1wYjPY61mhq6hIrYYCWffga5BRJm7SMgB3WmcOFfBQQ5twXgsIOCC/efGSXPulMLAeNV70F+j3ayYIcDNE71W2qMrIOdRzPkzVLOBUz1PKIidz0=
X-OriginatorOrg: studentconnectivity.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2953.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 550e053a-b7b8-4b61-2f3d-08dccdd0233e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 17:28:20.7556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f06dc3f-1d44-40c3-b040-812624058af8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2e+oXsIIrFr52XohLtbb54rSNb2aQc9KEN0XA7gjQQu/Ultv3OEZvt2xpbjR4ptr6eEqz0DUUkMcBcONco+GR7tqJ5zhZBXb4K8HuQnC91B9tB+rVM0Hx97QaTYwElP2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0722
X-MDID: 1725557305-S7jEUJBwOLtw
X-MDID-O:
 us4;ut7;1725557305;S7jEUJBwOLtw;<avery.harris@studentconnectivity.tech>;7a1e2bd6e41c9979d40d8c79ec756333

Hi there,
=20
Want to expand your outreach to K-12 schools, colleges, universities? Our e=
mail list of principals, superintendents, and key decision-makers is ideal =
for you!=20
=20
Our List Includes:
=20
*	Principals
*	Superintendents
*	Board Members
*	Department Heads
=20
List Contains:- First Name, Last Name, Title, Email, Company Name, Phone Nu=
mbers, etc. in an Excel sheet..
=20
If you're interested, we would be happy to provide you with relevant counts=
, cost and a test file based on your specific requirements.
=20
Looking forward to hearing from you.
=20
Best regards,
Avery Harris
=20
To remove yourself from this mailing list, please reply with the subject li=
ne "LEAVE US."
=20
=20
