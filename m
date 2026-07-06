Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF48379C32;
	Mon,  6 Jul 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347997; cv=fail; b=KZdvXi7JkfnRVBRyDdhwawcjGNokkcRKJRAYkfGWbzVZXPPOiMO90cegFWTEmZrZpqggGnTnr5D7DfF7SpBgx8o0ERg8C/ZXne886SXyzFikS81jPt9Ixvtpo3KqigZJ+gb0/5iaLN0CRfScM6evFWYL0EZ0o733cjDGqKC2/NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347997; c=relaxed/simple;
	bh=dgFKm+94HwWzf8Ojlx3bZOaqVpR3xVLOsfJ3/ZrDVo0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iWIj52D4I647OBNx8iNSL6nXONU8iG1iMsDNpvDykXMG1ZRxGH2vT7aIr1rEz19Ss+zqodYTPnS21pFdabQJz39SV1YRy4i8sC9HGWN75G1pBd/VKe/H8eUufOMgw0e9M1qkhQhPUCXR/kzkM/7+cnxQDkQzHgNOA5w4aQm7dR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ye9AAWrl; arc=fail smtp.client-ip=52.101.61.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ye9AAWrl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Msx4vTMb2jy6RJ4urpm3QyDI+I/JVngaFuVxsUl40EqiyJlmrdfZJA6qWvYDF4gzmZFOTUVHMfqbnvGE9aGZ9WJq3I1NwwFbiX2FYFQk34jwjTX5YX0h4up0RtYYc+EDfU+pdOsI7sJIuQ/XI0bYGlEdLOK/qjEuWzmxZJhCQyEAatuEVUFUTWkh40/lYmipiFpql2Z/s5Hw6luKSF/Jx7RJdiU/jVqqaxsI6NnlU/MqzSmvTW/5c1QjN/QJHvoCbYFfNPb3oj6D6bo6At0rMrL+HX9kreIVYRF/cqqkcSfNyboB+Z4UPXoY7f6AfJR4cgQXfl2+MHTaKcgSafRh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKfSs69j0rLnsWbA/euv8uaqXNcOzBva+tN2ZQP1QZA=;
 b=YXOjWCEETh6kGM4z5qSJaSxHdGGKNyUoLBMFA1ZUgRD5nE9hr87DuHHFTCelYB4MWMYlFepNZvSqT4QLRncwzpPk2NXXb0gMTvK+vitcecJ83NikuOGMEK/iuGFWSGnuVDMpGKSyxW/N/myoMJ8w3E54bJud30wpQ+kPd+x/ovcluAjMg8A6hi3u/PT8fevoQ9VbgzBNHGKfKZuWhy+u2PjvFFlwJjvxK7h/L+jX4CR5pNf7W0noEzC2MG/BN6l22XLs8TbceEVAgl3XCoQh/VuJiABYAK4joYXAzprD3iYnvBBFiH0p1VwEz8JMNMVql3Auu4b1enuCxVbELx68Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKfSs69j0rLnsWbA/euv8uaqXNcOzBva+tN2ZQP1QZA=;
 b=ye9AAWrl86A0ifTJvQXBP64zd1Ms9TW0cyz+xOItPmZcIEOLuhSKKOFa7BG/09rxCP5ZZ9VsuK62SzZxx1MN2XDLmXwvyc9vbGdctsnOQ5t0JzObbXnWUkGpfKOsWO4JltAltyiHOX14Y5qbsfEhdJa991NTGCU+8/6m+89bDo4=
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 14:26:25 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 14:26:22 +0000
From: "M K, Muralidhara" <Muralidhara.MK@amd.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 0/5] platform/x86/amd/hsmp: ACPI/platform HSMP
 concurrency and lifecycle hardening
Thread-Topic: [PATCH v3 0/5] platform/x86/amd/hsmp: ACPI/platform HSMP
 concurrency and lifecycle hardening
Thread-Index: AQHdDVLB4ezCzn58Y0WwEz4NXkI837Zgi8xw
Date: Mon, 6 Jul 2026 14:26:22 +0000
Message-ID:
 <PH8PR12MB7325DA925A4C5551F7E3F8ED85F12@PH8PR12MB7325.namprd12.prod.outlook.com>
References: <20260706142114.3202259-1-muralidhara.mk@amd.com>
In-Reply-To: <20260706142114.3202259-1-muralidhara.mk@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-06T14:24:58.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7325:EE_|MW4PR12MB7165:EE_
x-ms-office365-filtering-correlation-id: c66a1b3d-33a7-413e-1d66-08dedb6a8dc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|11063799006|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 yxZCy9Z6VYo+vkE0u08ttawAAiedVlwqbAt2Kq7JIlBAd2YOHH2tpLwFVU2l4JUbHOVsXv3RpuTpgPPpD287pc+9y4ZaRAL/QhRMwjYkwPJQo/5KKPTURXJWe135qIcnfCKify32o6pB7G2MkY5jjP1zJNldYM4VwqtksKVsHyQ5+43/PCsHKPEfGjTBXwMpONWxvhvgK+8qtTu+WRUj/rd66HQcGsRcpsAAayW7E7JAPmEZauV24AYV9TvlDjQIO02aFYCeTVt9pg7pfKzZQpPMRGl6Kp+wTOoecPdZ+Zgoq/IgOGSfWAfUhza2vInwfSxCgBWd0CyLtGaBKjYIxTWV3BBc7gNxvpLf3B/UU0uL5FSPb0k0QgMpCe7143pUyELawjkhT76ANXaoPXNXFScj3sFTQp7oib+a7TIZprkvWE/3cD2rgFEdChAuJfI1n8ufoBreGnup0E9HfG838OS9xy1B0oY3tJXLou5aBnMUR8Z/lMqnUowkmSTmiVSD9KqCoHd9OfRRc7gx6NsKD+MdfT/tsq+3TWC4OOA1xSxqchKEwas/i5cJCiXC3kKMwI3yvNXeGzdnrloWjL6Tf0MOIpb5bEGttbdagCx7DDyf1+Zte47ezwxMXuFnmGHggoArmMP0gRY9F3+SN3AyDfEeLlGFmPMZldDzJ/hYo9g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VNPSK0rxwFYbgeLVXVutHOG4WaggVorb/DPZoxxYeuLBEaA7opHfI/wa2qEB?=
 =?us-ascii?Q?DHHVHQaBkO9zVtFzHqq2WCSHB5+Y3+Rz+77zKgzX4aIpEOuyF9xFBFUNmaMu?=
 =?us-ascii?Q?bBi0R0I4WnrLkm8N1vJladKLOBVhJCjykF5Ga3QnDuBrhMHl3cNy7cp4KkvU?=
 =?us-ascii?Q?5NEs9Z9N1AYSfBAlTvrmbzmmLuTN8McnwUjwvQz/sPxVIaGv2es0dOaZs6Tj?=
 =?us-ascii?Q?3pcqDMAZZQ4d1qv4/ma2q6Nx3twl2Rz/7l9ypZIYhXpkEsj4lQs9QR9k0kcQ?=
 =?us-ascii?Q?hG+o2Z8RQI57TvEubF0CbWwvRc4+I773OwDBRpcKuHSb2rrn6Ctmpoje6B/l?=
 =?us-ascii?Q?FQNdxt5MQRu5QP1w4UHvEgbL5Rs3f9goaS/HWx7A7lawxX7LX2Ndyb5zCv26?=
 =?us-ascii?Q?baSrmkXwg1zDgoiQyjOfF1rcYhq6n4/xcRvy/cb/7phdbuVzoT7pegNkxBZS?=
 =?us-ascii?Q?T2v64MYOJ4JiaDZJAN1jCg0zYzY00/8ojRr2fkR7ehIiE0XQA2Ilt7G41uGl?=
 =?us-ascii?Q?aIEfi/vDxFHPbzJae+4dpUh+89oGp1Ta5RTp0IAeiNMvivWomMp82Dt0MR7W?=
 =?us-ascii?Q?fJo/OAp284l+rEafGF178+JoAGQlZX4ZHtiLBJbyo/ZcohVMaOIIeGHiDqtS?=
 =?us-ascii?Q?iILhgmn7o4jDG/pYcmpJVvmRc21YSQCioLf3f6ry47Urf/1QB4j1I5Rw1iDK?=
 =?us-ascii?Q?l37FTc/DFNssyMG5WWZXiCoS8zaeXU6iTfO015CVk+rZ4m/Mv8uL4NXOWl7H?=
 =?us-ascii?Q?WHEVggNqEzgvmb61UMDq/XxvsgypQmGqSMZ0FM1eVha27Xjn++GmVHiHd9bp?=
 =?us-ascii?Q?HXL+mpDW1WP5ZJJ8qBZQ7Vw34vcW6/ZrjgNM4DVdZ3rQU8uVU5bnhWyhrgar?=
 =?us-ascii?Q?Y1UG1Cn+dQZ04VhDfkVepTVG4SN+k4WUaweJCamspBzPB6uljsE52sJnErmC?=
 =?us-ascii?Q?UVUOhCV4BPWMSMl1i/nIi72CKK5S6VvejWMjWGKdXhMCfvu9YHcSBZd8yETb?=
 =?us-ascii?Q?24/0o8qQNDlGcm55Q+4cTUmDMqtRP23TyNHzy4Sy9HRr8KbjUC/xHr3UQEu+?=
 =?us-ascii?Q?BR7mX4SZD87IYlXyBYw4XGCpfNMJVH9LXTJXJ4yNVRJO2V1XnnghKb5uEPBC?=
 =?us-ascii?Q?+KT1dW2iBk6f/GoB47U1Z6jOpLojQIaFgkKZNt98e8/oNpZZY4ekKoynXXAu?=
 =?us-ascii?Q?cVXfg0Rri8xxdAiZusjlMj3h+ipfTj92kqLRndimscOsc8DQxBzqG+wMahQZ?=
 =?us-ascii?Q?adcj/mWS4YwAyCAzHROly9JJkGujxN6k4DdtED/8jSea18MJoTtlY0m5kX2R?=
 =?us-ascii?Q?SqY7LIi95uA7iUabRXKPvMpeRtCpB+hnYS3J1ueQylPJ3WG1HjonEsetwGoF?=
 =?us-ascii?Q?1crb/9gNDe0Nl7zJrMLm/SRnexwuD4Tz7vrVO8vq4lzxtuVIVVv/r04gqtAK?=
 =?us-ascii?Q?fyNvw9Qtfcg6v0a2bZJqwKsQuOndLaadpGxGcAzFWnd1WrFWytdAhomsQmGj?=
 =?us-ascii?Q?V7sLmIXMUfcekq+hl8ic+QAO1DYQfFrqILBS9MKcwylOMM9+ambhkPhUKaIl?=
 =?us-ascii?Q?GvWiGsL6WVjrCJHLStdgeOk45DkHVNALBGpdXNsANhMxSmhATscuCOXjUHES?=
 =?us-ascii?Q?o8WFhENyUA8R8/5f+HYFJF1MR+vadm/fUbV8kGfvvO+eDBJtolfpP4qzx8g3?=
 =?us-ascii?Q?+RzR+rQsZrV0IUNPf9pAyH5xSjhiM+OaHBl95Spm21nRqbG2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66a1b3d-33a7-413e-1d66-08dedb6a8dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 14:26:22.4357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xaSWzx361RP47/IjhUmROqHnKLX67lt4tUE7eZEOZBOtEqzSEXHRD8nzb7Jq1CCJWNeN+ILHVdxWb1+0lySnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165

AMD General

Hi Ilpo,
While sending the patches observed git-send-email issue. Please Ignore this=
 series, I will resend again.

-----Original Message-----
From: M K, Muralidhara <Muralidhara.MK@amd.com>
Sent: Monday, July 6, 2026 7:51 PM
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; M K,=
 Muralidhara <Muralidhara.MK@amd.com>
Subject: [PATCH v3 0/5] platform/x86/amd/hsmp: ACPI/platform HSMP concurren=
cy and lifecycle hardening

This series hardens the AMD HSMP ACPI and platform drivers against probe/re=
move concurrency, use-after-free of the per-socket state, and resource leak=
s across unbind/rebind cycles.

On multi-socket systems several ACPI platform devices are probed and remove=
d independently while a single /dev/hsmp (and the hwmon sysfs
attributes) drive a lock-free data plane.  The existing code raced the glob=
al is_probed handshake and the one-time socket allocation, freed the socket=
 array from under in-flight hsmp_send_message() callers, and leaked metric-=
table mappings on rebind.

The patches, in order:

  1. Serialize ACPI probe/remove/init_acpi() with a dedicated mutex so
     the is_probed handshake and the one-time socket allocation cannot
     race across per-socket platform devices.
  2. Map the metric-table DRAM explicitly and add per-socket mutexes.
  3. Add hsmp_sock_rwsem so the lock-free data plane is drained and kept
     out while a socket is torn down; wire the non-ACPI platform path
     into it.
  4. Refcount the ACPI socket platform devices with struct kref and run a
     coordinated release on the final put (deregister /dev/hsmp, unmap
     metric DRAM, free the socket array); clear the per-socket dev under
     the teardown write lock on both remove and probe failure.
  5. Drop any stale metric-table mapping before remapping on rebind.

Testing:
  - Each patch builds individually (W=3D1) with no new warnings; the series
    is bisectable.
  - checkpatch.pl --strict is clean on every patch.

Changes since v2:
  - This revision covers only the five ACPI/platform probe, teardown, and
    lifecycle patches.  The ACPI UID / _DSD mailbox validation and the
    sock->dev readiness-gate changes from v2 are accepted in maintainer bra=
nch.
  - Reworded the teardown rwsem comments in "Serialize the data plane
    against socket teardown" so they describe the drain contract in terms
    of a generic teardown path (a teardown path takes the write side)
    rather than attributing it to the ACPI path, which is wired into the
    drain in the following patch.

v2: https://patch.msgid.link/20260625123337.886435-1-muralidhara.mk@amd.com

Muralidhara M K (5):
  platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
    mutex
  platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket
    mutexes
  platform/x86/amd/hsmp: Serialize the data plane against socket
    teardown
  platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
    release
  platform/x86/amd/hsmp: Drop stale metric table mapping on rebind

 drivers/platform/x86/amd/hsmp/acpi.c | 147 ++++++++++++++++++++++++---  dr=
ivers/platform/x86/amd/hsmp/hsmp.c | 112 ++++++++++++++++++--  drivers/plat=
form/x86/amd/hsmp/hsmp.h |  11 +-  drivers/platform/x86/amd/hsmp/plat.c |  =
39 ++++++-
 4 files changed, 285 insertions(+), 24 deletions(-)


base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7
--
2.34.1

