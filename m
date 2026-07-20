Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010049.outbound.protection.outlook.com [40.93.198.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F263F363C61;
	Mon, 20 Jul 2026 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561575; cv=fail; b=XlcWE2KHp1CqhjnjuZtH63M6/KT7yBrU6O2Qj8rQWPxIXcnGmip95Y+2/IXGxV/FuHaZ8s5mpWP+vD1Sct/OfDe7Kf1WrdqO2dbeRkEclQu3sy7Bp7NGs4c0UGIarcp9Kxb00RZGjhu4HBCuYbCu8Xc3zk3u7jaVX3z/v5FWYHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561575; c=relaxed/simple;
	bh=UwLiU78o24fz8g9A4+bzDBiXakITP6/mLxSdA4XNvCA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tlvQpLR6gTAmNSk0jnsYHeg6Xbjd+HaErjW564aEFiBPP+Pze1cjuwi7kVu1uUjzWpXnXnuu1vp06KCtGQRkMJZra+Y2EOygBvtpDc+f4dcq57s1hDOXLwN0shv+LkdEcUi5K3L+o8hSYj68FXUjxSSrq5OUalfXl1YXBe9UyJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Wvn91kLH; arc=fail smtp.client-ip=40.93.198.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Wvn91kLH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4AuEhB6wknA9IL86gsOprSDhfrG3JPQSn7GnLiWXyz+T0CcmX3y4lfLYSVgdRDcCJ+z4r1cZc6aAyISP4auuk/981otwpaJZz6GW9ogu0rUzCAVXueiu1w81vD9/zfPfg6gRAEE2j1k94BVP1NFpVqEGfVMI3XuWUfh82v9t0Yw+0NoaeUF2/08IoDD8tjVvCt1KED/pF69G3Y5NnTUYPk4oS1RFIqygga4YU90+xweMndl8YjndsVbmR6Hm+vIrjPY/ySGWIFiACc0WSgFMj5SvaK4FlAs2p8HHCTXUnH4Pv5pUsrKC8My2M8RGCgxA3dJLRBjbmfPH6UdbeK8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f49gu7OFEB3+/g1EIVfFpPhHZn4FLg7Gl2iznpkSoAo=;
 b=yfoRpR21ygYt02bpOcnkGiCOrQr/i13vljRiICgGhxp8Vx7BYRR6DMReiTicCTzzEt6eUd3eVXD7WBS06+iY4+e/mI1rdjcgNCJkqEozQYlAVC2gxVPPyQgS4HSn69T4iDMLPn5jL5S1dFbelaTIgRoDfJWjXqm0itJ/7I5EI90fL1rwO19pDsQOOjQ9IEm5zewiDGB4H9cFDx1sveP+tEAF/KRToRYSjBBfMe13Gjz7A74MHka8nrgqCjQn/oo3CZWYUzgib63U+yYkQWkzNmGW3ek6+YnZXy2drAzPb7YpTyh+nYF9alMxSaJ15qpEqEWCZA2xogQoJcLWalEHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f49gu7OFEB3+/g1EIVfFpPhHZn4FLg7Gl2iznpkSoAo=;
 b=Wvn91kLHnl3gEPX4YpU8QO2hBbcRU9xAKp5mJi+F9FFf/mkoqYr224yJxZ1zMm/BTTKnujRW6ponIwo/xdNgxGxY1aMrd9GLyWvdak3D1x9/a58Fp+KMbt+z8JX0/JJUL4VxTB6UxjC5WjNVcUc4htj4Dmc0l7iK4d6pwutqTfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:32:46 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 15:32:46 +0000
Message-ID: <7608d951-c2df-42e3-8738-9e83e6c8d408@amd.com>
Date: Mon, 20 Jul 2026 21:02:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260713044005.1194115-1-muralidhara.mk@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <20260713044005.1194115-1-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e91a262-d6a7-40cd-9f36-08dee6742623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8gPbu9OV7LCSmxJe12pdAAIikXd8tIVwE9KKRiCP9QhWyOb5SNfd1WmcunhcnGPR8ssBYdcLB/9QBBTp6r8vAEk+PkH0e4kIg8iEr/ctzAfrG8lWFcLLX6qAkgoZF+zRqBr5Dj+OIIDWrrXTsnmTiRDMPgmz8ls1TE+FPXb4sZ9eCczPtZZc8GttDARoY03IFut36NIwQphv0VRq80DQr8DmtBiPPNykgNwde8PJiLIrxHBToNv9pm+t/8R2meD1cNGgDci4YgOl8KGS+SFhkeDlun9nhargaXUKa8RxyaC4FVVl9eCyAqv9u8fhGH4MuE+K7k2jdauAYfnQ3ibFGsgsLoWlCQibCutivuKXDLNXsjVXPjwj5uWlBn1MfHcOjcE1w0anTB21wRynGkSyj3SEr4WzbmdlmQQAv5iaMzeVhhA6vRWKO/UUxqLqIVlvJro5MJFxALJTObt0PAO+WzdvUiMsu1Gkr+cIk9mZ15X3kPhyqnv7SrmbxK88umEeCU4huiuk15BaUqk8/epqTx5hSVMudyVRMoc3BJ4n3Gh5QjgIOvvaXTu2w/cY/TKl1qeg6pxv8LVWkmdP15yMtKTQKb2k7P+WUncjOXel7LZktUTjM8ouwJGf3It9K/hPeA2Sz5sPg46OC0OZjCMlN2oTjrAEP3gH7XhrYu+56Wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1BFbDJXY1IyTFBrY2JwZEs0TkxueEFVR255d1FsUU9SUEpiS3RLTTdDb013?=
 =?utf-8?B?RElnYzRoYy9ENEs4VU5waE8wdXZVbkE1NFBwelZoZGVzM1ZGbU9VQ1ZOR0hK?=
 =?utf-8?B?NHRoUUhPbTdnNFZVQWdxazh6L1pmQkNrL0hZMVR2OVduSWVMNXVISitacGxQ?=
 =?utf-8?B?RWJEc1h3TURnb0xvQ3k2aGxVZXdhNVk2bEdIaEpyUDc0QlhJVms1NFlUcWx1?=
 =?utf-8?B?VkNzaUtRRVI4MTdKdU9sZW54ZEJEb0Q2Rm1tQUZEaEw1ZXF0WGsyYWVMUlMv?=
 =?utf-8?B?OG9SZjlYT1ozYVA1NlQ5V0o3eDdKRjErOEQvUjlqSWxFZ213NGR4K1Zya2tZ?=
 =?utf-8?B?dzAyM3MreDRaazBtNVlmemt2TGZzdFU5dE9qOHJaSW9DRFRpaitsN1dYeVNl?=
 =?utf-8?B?YkRDSWU2MjhjR2FPaGNHbW15RFNBU2tDMFNNczJGOHZmQVFoNklqMEVmSmt5?=
 =?utf-8?B?Q1NNTEZ2MlJBRjJGN1ZUTEpnYzFtY0c3dFg1MUtiQ3hhWWlRYWRKMjZHOHZY?=
 =?utf-8?B?ZW1zTnN2OHhpYjRjc2NYUThMMXhnU0VHNGRiVEJhMWZ2cGZBUzZkV0lBNHdT?=
 =?utf-8?B?b3NnYk04VDNDN2pSTmhmT0YrY0czeFovYXNVd3cwTmEzZ09xdEw5UDY5aWFB?=
 =?utf-8?B?RjlqZVlpcC8zYUF4YmZuRVRmUktWeFVib3ZmS010SnZHNzQ0U0Y3UjdNdjVn?=
 =?utf-8?B?dzVENXlZaWNjay9UbzRvY3pndkpmcmMvdWo3bUVpRDc5NUlMZVFqSU45enlV?=
 =?utf-8?B?UHVrWmtyZVUzQ3hQUHlXMTR3dXRqU0FOTXJrTU9ock1Bc2NWSk5vMTlwOGdm?=
 =?utf-8?B?Rk5LcC9GREM2VWd6Y3F3dnQrTFVkakhBcjUreUduTytFRXpmZzhkVTF6ajhG?=
 =?utf-8?B?UlNiUTVDSUYxZm1BallmaXdmSi9yVmRSVS9pNzhvNkpCdFFQZlRzT3VpN0NC?=
 =?utf-8?B?djBvVmtwenQ3TnJJeHg3V2FPU3E0R2QrUW50aStmUnpxdkd5bVNuSUNvcDNl?=
 =?utf-8?B?eHhyeXFSamd6NkhTRjdvL2NTYTg2OGhETFM2T1pWSlRvSU5neEdqem9tWGtv?=
 =?utf-8?B?WWpBZmdSNnQzbEhnVURzandOaFNMd2JpaEpYd09YZXZXSUxGclN2KzY5RVZl?=
 =?utf-8?B?amJQL3lGckJBRGFsdXhtVWxDcnBSdTBwR3NFQkMvTlBsRkIycy9HS3FzOTlC?=
 =?utf-8?B?N1BJb0lkUEl5Y3QxL1pYbDcrOGNQRzlwZTZIWWpGWUp1d3oxTUN0QzJqa0pw?=
 =?utf-8?B?QnlxSEgreExBZGtiSFAydVUxdi9FSmFuRzc5a2R1WEZEc0ZoYXVIWm9xM2xh?=
 =?utf-8?B?ZGdmaWhTZzBNTEp2Tnl4dXcwdDlYcUt4djFkRm5OZGt5OGNPTnBHMVFqVmx5?=
 =?utf-8?B?S2RZSzRwZlJaaHR3SmQwV2FqVUphdFlMeGNKaUJzTWxJZ2Y0SkhuTmVFMHl4?=
 =?utf-8?B?UWdzejJjYjk3UGpBTEFQTnFROTlJTFdtbkREYlE5WlV1WHJBL0NMaS9rSHZq?=
 =?utf-8?B?ZlZBNFVmajNWNDIvQjFDU0hGdUxjUGFXc3BiQjVuZEpjMXVpS29PRVN5TTZl?=
 =?utf-8?B?RDdwTWhWQThtMHhsWGk1dEc3TDRIejY4ZmZMRUJpWW90NmhWa1g0ZUp4Q1FT?=
 =?utf-8?B?NCtkenQvalI1RGRXTUNXSG9IT25YcEdQdWVxZGhvT1JWNkh1SXFiRVFHR0lR?=
 =?utf-8?B?TUUwUWloMTJOS203YlRBRWtkWkhxSDlYRmp2anlWV1piN0ZJUlE2OFJiRDkw?=
 =?utf-8?B?MlFkNElXbUtDVFBTK1B2R0E1OTdQR1NiTVJ2cnhmbVQ3QzdhbUFvYnlwQW1Q?=
 =?utf-8?B?U3VCUGhhU2wyNE5VT2Uzd244aGxraW9FVXlyUmgyeDY4SHZabzNsWEgrcmxY?=
 =?utf-8?B?dEtZazY3Q2NKRERtTHMrcXpyWUpYZVpGT2p3S2cyOEY1SmhUUDZ0ejRrcVZy?=
 =?utf-8?B?UU5xR3Z5NytmTVRMQTEvVGhnbnZ1TnRJdEpabE1QN1lMSys2OUhFNmVLYTE2?=
 =?utf-8?B?eVU4QWg5VWZBZDFDT05FN2ZXQUxhaGRwYkZzd1o2NE9LdXZwWnk4dHpnelNn?=
 =?utf-8?B?WFQyVHlsL25uSVE0NDN2UGlJeUgvaVNKWTNCVllRS0xkWTFFVDhDUVFUc1ZB?=
 =?utf-8?B?bUx1eXdEVnpMQlZpMjVydXE0NHZHWFd1VkhMcmQza2NpZGc2L3hIZFVHWkJB?=
 =?utf-8?B?UTlNTXluY0N3M0o0a2UwQzBPQVRDK2dNNFEwalhta3I5dmtFR0VUU29WZkRa?=
 =?utf-8?B?WjZZVDlDaTR6WTBRYU1ZVi9YL1FJTWlMZXRDbU9lNVE3VEJYYkh3SDFqT1Js?=
 =?utf-8?B?bTVYd0h1UHNFZXB3QVppVm9pMlBVZVIwQzErRy82NXhzU1ltaGUyZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e91a262-d6a7-40cd-9f36-08dee6742623
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:32:46.5100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ll7GOKg+GFfZcX/5FK87aaDsDi1GhLV4Z5Wy5qsvbr7BqmzovXM/mjRlEfwtwHS6IiU5Y4sbp0sChUz4IEfHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663

Hi Ilpo,
Could you please review this series.

On 7/13/2026 10:09 AM, Muralidhara M K wrote:
> This series makes the AMD HSMP driver safe against concurrent probe/remove
> of its per-socket devices and against the lock-free data plane (open
> /dev/hsmp fds and hwmon/sysfs reads) racing socket teardown.
> 
> The ACPI front-end binds one platform device per socket but shares a single
> socket array and a single /dev/hsmp misc device across them, while the data
> plane issues mailbox messages with no coordination with driver teardown.
> misc_deregister() does not drain already-open fds, so an in-flight message
> can touch a freed socket array or an unmapped mailbox on unbind.
> 
> A single rw_semaphore, hsmp_sock_rwsem, serializes everything: the data
> plane takes it for read so messages run concurrently, and probe and remove
> take it for write to bring sockets up and tear them down while excluding and
> draining the data plane. The fix is built up in small, bisectable steps:
> 
>   1. Introduce hsmp_sock_rwsem and hold it for write across ACPI probe/remove
>      so concurrent per-socket probes cannot race the bring-up handshake or
>      the one-time socket-array allocation.
>   2. Map the metric table with ioremap() and release it via a devres action,
>      so its lifetime is no longer pinned to a single per-socket devres scope.
>   3. Serialize the per-socket metric-table fill-and-copy with a mutex.
>   4. Clear mdev.this_device on deregister (independent hygiene fix that the
>      next patch relies on to track /dev/hsmp registration).
>   5. Track shared socket ownership with a kref and a single coordinated
>      release helper, drop the is_probed flag and unparent /dev/hsmp on the
>      ACPI path.
>   6. Add the read side of hsmp_sock_rwsem to the data plane: split the send
>      into hsmp_send_message_locked() (asserts the rwsem is held) and
>      hsmp_send_message() (wraps it in guard(rwsem_read)). Route the probe-only
>      senders through the locked variant so probe, holding the write lock, does
>      not recurse on the rwsem.
> 
> Each patch builds on its own and the series is checkpatch --strict clean.
> 
> Changes since v5:
>   - Track the shared ACPI sockets with a kref instead of a hand-rolled
>     unsigned int counter (patch 5), as suggested on v5. The first probe
>     kref_init()s it, each further probe kref_get()s and every remove or
>     probe failure kref_put()s; the last put runs hsmp_acpi_sock_release() as
>     the kref release callback. get/put still happen under hsmp_sock_rwsem
>     held for write, so the atomic is not strictly needed, but kref gives the
>     clearer interface.
>   - Keep the rwsem read side for the data plane rather than switching it to
>     kref_get_unless_zero(). The kref tracks the shared socket array, but each
>     socket's mailbox is a per-device devm_ioremap_uc() mapping that devres
>     unmaps on that socket's individual (non-final) unbind while the array and
>     the kref are still alive. An array-level kref would keep the array from
>     being freed but would not stop that per-socket mailbox unmap, so the read
>     side is what serializes the sock->dev gate and the MMIO access against a
>     concurrent per-socket teardown. A kref_get_unless_zero() data plane would
>     need a per-socket reference tied to each mailbox's lifetime, a larger
>     redesign; noted for a possible follow-up.
> 
> Muralidhara M K (6):
>    platform/x86/amd/hsmp: Serialize ACPI HSMP probe and remove with an
>      rwsem
>    platform/x86/amd/hsmp: Map the metric table with ioremap() and unmap
>      it explicitly
>    platform/x86/amd/hsmp: Serialize per-socket metric table reads with a
>      mutex
>    platform/x86/amd/hsmp: Clear mdev.this_device on deregister
>    platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
>      release
>    platform/x86/amd/hsmp: Serialize the data plane against socket
>      teardown
> 
>   drivers/platform/x86/amd/hsmp/acpi.c | 146 ++++++++++++++++++++++++---
>   drivers/platform/x86/amd/hsmp/hsmp.c | 113 +++++++++++++++++++--
>   drivers/platform/x86/amd/hsmp/hsmp.h |  14 ++-
>   drivers/platform/x86/amd/hsmp/plat.c |  38 ++++++-
>   4 files changed, 288 insertions(+), 23 deletions(-)
> 
> 
> base-commit: ff7836fa850c2f815bc219f1e48f6ec8699f4ae7

