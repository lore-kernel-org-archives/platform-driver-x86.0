Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C64344D80;
	Mon,  8 Jun 2026 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935291; cv=fail; b=CsTyBPWc01dUAV/RFEnmrccjq7LlPZpWqUtG8QCRVGuwRFDRdwk2BdJlh57ASquQGyo/A1ArRWx3zymH63UDeWf5u3E95ehhTSBbDvXu35gBT1ZGIrUygXLj5JPQs5NykCf1LCN7NkBL5lAVGO8GqEYAO/8BZa7AE8UYMYrDFlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935291; c=relaxed/simple;
	bh=nDESsmTjDPd9H37oLuXQ5LVg9atlLLdcZG6P4DSzU2Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ej5lgd5qeL8K7zQotS1bNF/E92Ul+wjXof6EaozJhuPf/SBqiPqMEHK3g87Z4oW63NP2mIovsHJjb16/1Qd73HF5H1tb/HPCZTsY2s3gxGZkgmwmu//e09FZHELrHQx71mxFo1087A6iwpTHgC7Mxc1gvmr2OdsnSYMV1wQdloI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CYSiU0Xx; arc=fail smtp.client-ip=40.93.198.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CYSiU0Xx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7i6V9ATiE5GFxgowGgmTL/bozpC+Jb/f1gicDPz3fWTIO0Z2xbmYOH6Dl82nZUUxVBK9sHoRCy2MYu2gJ99ghsQbxDzIYwWO4ASjIEEnUhOjyYjWTef6XaF1zxs3HsFdzqrhxYblw68ZdJixKXY4l/m7KdzSV6mfVx2LWatAXf3Fl5PMy8TRUgVackwhc7sk0Z2nlTtY6hOUdIwr4tM8U2dcG0a8glkm6yihNourFCNY0dEFc9rHH3KMFrms/9AQJytx7aVw5dS4KGl1oD1S9emrN0pWa9+1iF7SY8OkBWHcQt7PObdIr84XZQmN0VE3pPOgLr7enDaufx7B3RF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjNxQL4qdVLq7lxX+tNdURH2WL5vaT8EyjfPHTDs/Tw=;
 b=O1Gqs5195iQHIEkDRAbc7rNH4nptZCextb6ekt6MLGkKYFyVP9/PFqLmvgbaeZbTmsmcJRAUf08bbMi+pi83oQtooBDn7LQzeIQTuNRgwCKCLRAVanaR+ErbqQ2NcYiKQCgRzFfwg58DlcCPm+RhELAbc41vQatmqx8TwNUKFlFQkuc3BLXHRNyKaLoPDUA8CyV0bRwvbzis908onZGoJ2iF0s0gMPsxZ5v6hc8XNPw4bZytuAZmHnqtOJ4+WU8nk00XIrm63M88kvbqS8ElKc0uaJ8sinhFB5ItpXxoNmT5yws3EOVUrK3PsTWQWMHDS7AXXiO8YTKL0LlBfTwDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjNxQL4qdVLq7lxX+tNdURH2WL5vaT8EyjfPHTDs/Tw=;
 b=CYSiU0XxAjWjTLR1YLNOu9DwKfReJO4ed37ULmApgmtKBM4lmAe2ZuEpAUl7rWxcevQho/0E4uxFGGccxxH9gvWM6aIThxyEz5Cdni522o80C576pWgnvOda5mKY9HwIiNzF3/x1TUGbHCjCyQWDsTlELgtLf7FtUZF1EaImgEE=
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH7PR12MB6977.namprd12.prod.outlook.com (2603:10b6:510:1b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 16:14:44 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 16:14:44 +0000
From: "M K, Muralidhara" <Muralidhara.MK@amd.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 0/7] platform/x86/amd/hsmp: Support Family 1Ah Model
 50h-5Fh telemetry
Thread-Topic: [PATCH v4 0/7] platform/x86/amd/hsmp: Support Family 1Ah Model
 50h-5Fh telemetry
Thread-Index: AQHc7oYB8mBEmDJq2kC2ox5Kf+PCo7Y05otA
Date: Mon, 8 Jun 2026 16:14:43 +0000
Message-ID:
 <PH8PR12MB7325382A1DDC4A886C25F0D7851C2@PH8PR12MB7325.namprd12.prod.outlook.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
In-Reply-To: <20260528093954.2461272-1-muralidhara.mk@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-08T16:13:51.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7325:EE_|PH7PR12MB6977:EE_
x-ms-office365-filtering-correlation-id: baa84e83-c705-4b78-ffdc-08dec5790d60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|11063799006|3023799007|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 0rJGUqc2B2sSXwdxdwWs4uOlZZGZlRdhod3/6dl0dns0sZ2Qst0q5Pfeduqp+U0HZ0c3mjGOxnIaP2itFjqwzDs5ry5lEVUwcrg4eF7mV5Kkid2DVGjnWZu6opI6z+90/igVC+v93AeYHkjKlB7WpEA9cdyG1BOlUZhE0cNxT5OucFH8DqGLv6M6N1bJ61IAlnfEJwC7p4cPIYKZtoGR9FGRzr7gPvjnQNv8sTDktnB2lMQAt5EBXs44fBZ2cLaPJ4x/cwU4WU5FgtlqKCJ5O8ZCrksKyOPfJSxcSs7fmbm83956T4AKAEytIOTsEdV4LgXpoM9cVsP3qd59gt9enPUffZ1/GRqOe8knnDBcJbp0+bE8QBoaZaWOwKTrBcUDjzFaFfyZj+8q7B/6XWj9X+26E3/HtFZFC6SA1IRwbEzzGK8tAtshpvBNKjtrvdye8KTNaHmW2ktGPjJwJVjVvnVrWvRv8nn7ymrTnTnrPWcJvEUVGWRhQTNfOLWm1g0kHHLhfh1lzJP0orWMwH1O6tfH5pbqaIH3mgcAgQpH+5DGgGrzjMcmJI0UMtBZ5IjYnsBwB+GKxREOW5PL5oqh2JEcm5pj78Q6oPui5NYxO/G84SScYWDd8NKWQOXgjDGCRhC5DNif7zh3IxyxHKvtdQHukAKZbnuGUOkPaRQ/5ZlT9d8ReXIxXKQRW9NIPcIobj2hmBS9kFC1QxHcE9S7fvSufgO/KO8OXqyFAtag4CE2u8UriaLjBADDhvv1EPWW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(11063799006)(3023799007)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E5kvuUUTeTT0Tu/BI101AzY+02HSGGaXf5LCKxFdPOdmmuk4uBpRgeKh5q53?=
 =?us-ascii?Q?0uxgGqr4S9n8Krq6WWvBB6Fr8zUptnX8vVpjx0KNXtv80YgGh/gi13Ut6QNS?=
 =?us-ascii?Q?RAleZD79SJUA1RKEgPrCy5CpjDNaiEhuU0fPsToHa3rnkpASnizW2bCnE/81?=
 =?us-ascii?Q?U/Z4+sO6+8X5aEPpTWat9UM6yMLOwvBRYr/DXttTXka0/OoCSEMBLJDCs+7B?=
 =?us-ascii?Q?17neSAKDH9iet/t4MnTxySStTj1JB4GIf1/1nHoFrBSyTlKeGvIgmPxLnhUA?=
 =?us-ascii?Q?doJpTdjUbFxpcMcKh4b1EumDIoxp7rKigibq8sSTlR1vrz15PtAq6Z/aZwWL?=
 =?us-ascii?Q?8izq1orNvyxmgDlzwwQxxrCZBTws6Z53oPwu3sDGIMLGk6I8nYXz8mnh9hcF?=
 =?us-ascii?Q?3OGZlBSEA+BvSqnDu19A8p1rWMNB3HnK+IAg72/HEIPNFA18ZuwHezXry6Ny?=
 =?us-ascii?Q?bFm7Eld5cV2z96ZYfGqVS9UooJ1qS8kUni9CqTlQlwO+KMnDnjxJnGOd2M+F?=
 =?us-ascii?Q?5t+nB42hAc0hjoMa1oFzsJddbXz12aluJtCkztVWWtvN/Wx9QnFAG23L0efQ?=
 =?us-ascii?Q?Yq7bTHm5JgQcB0uKOHOn/UBWmpSx4LKHGu0kjvQE8AyKbcrH8kS0OLztsBWF?=
 =?us-ascii?Q?/HEpOvn83GPWqFzhcOxa4bkZ1mALME1gAjYdRryLa5nRtoHQ3JdS7W+CQv3s?=
 =?us-ascii?Q?a6wJVj15zIS73kDgZKFmlxaGxixE+24VuJtxX2Lkmqf+PQNRXAz4nJgSCRnU?=
 =?us-ascii?Q?aoSJz74K/OVwdGU0ogLEQ/QejggmGMNdaLzWs5HG7FV/zID/i+udbdi02hZk?=
 =?us-ascii?Q?rKShy6B8/kDipnZbp8nRsAMdL8UBA2jpHreB+5OgkWQOR5iIQFJ2bCBh7HgJ?=
 =?us-ascii?Q?XZntd0VlM8+p8IAqsq7wRkip+GJ4emoAlwHjoW1o9BwaEBDI0ZAuUTG3chVd?=
 =?us-ascii?Q?+b7yZLA5SjhVOS9L8y/D7SeERLaMNmNdEMybYeFJ+2rqJM7sIYyOIVgY6Ok7?=
 =?us-ascii?Q?ij6xzEL95WQxhGJdDdNAzjRPORHQJ8b1Oq2ozC/PrkWz2nsB4BVfigmXYkJi?=
 =?us-ascii?Q?evZ0ImtMXJorb3sezY5av2Od9huc9ufJGjNAgu+FmVqBSPUItFwqJaBg5cf5?=
 =?us-ascii?Q?EawAaqL4PgROoH+XiToVNiFw/6CAXg5HRnepGena+/ubMfscsssviCvqOhHF?=
 =?us-ascii?Q?VkcNjCTi/JlsQ5JvgB+8KNS0+UQtJfnimYZFiqTjl69oC52M4WpycNBHJCNd?=
 =?us-ascii?Q?XFelyB+VcHjJiKCM+CdoYzHnkd8n019FTGfjCCZN7Ik22wkZ93iZg5r004zr?=
 =?us-ascii?Q?K4DzY0XjzF4/Z1H/hS9exE19C+ZPSc47eZeMbm7pWX9b1nCgIw1/ESpkH9aB?=
 =?us-ascii?Q?T9E/fBO468Xlpwj1XuK7Pvca8aehrgJHL8Ro4rsiuRA8MAgh2bBXVxka0Izw?=
 =?us-ascii?Q?Vei6EYWSYBMSKnOqWob/+QmbOtzDhCc64/kviM0+br+AWopkVjEh2tgtxELz?=
 =?us-ascii?Q?8fZwwQabyiKmVEz3Nq70lx0ung8HIfFKv9KsGliUawL42VsomISb9xBmf+O8?=
 =?us-ascii?Q?YKHJP3YDLoUxiQ4idb5qtHtzI4DpKB9PWXRLvOkOTzUWLAo5zONT+kA9f3RU?=
 =?us-ascii?Q?Bib4Sk98aH4G417wlgOeVw3DktHwQu5NJHauAyqXVcBGK7zboPKodcir25mU?=
 =?us-ascii?Q?y8nocvHhY1Y8DwpVmj4/KTyec/x5bhTfbxVDeS0URy9n4CuC?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: baa84e83-c705-4b78-ffdc-08dec5790d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 16:14:43.9026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghyDaa0Q9VDdGQPeFF5OmWumqFoxaevagW/qdBQqOKjCKACqKFRBE1siHZ4cpu4NKEmm0jr0wNh8zW6KOl1X2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6977

AMD General

Hi Ilpo,
I have addressed all the comments, Could you review this series.

-----Original Message-----
From: M K, Muralidhara <Muralidhara.MK@amd.com>
Sent: Thursday, May 28, 2026 3:10 PM
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; M K,=
 Muralidhara <Muralidhara.MK@amd.com>
Subject: [PATCH v4 0/7] platform/x86/amd/hsmp: Support Family 1Ah Model 50h=
-5Fh telemetry

Hi,

This series adds HSMP protocol version 7 support to the AMD HSMP driver for=
 Family 1Ah Model 50h-5Fh systems, and addresses a small set of related iss=
ues that surfaced while wiring up the new platform.

The bulk of the work is exposing the new firmware-defined metric table layo=
ut to userspace. HSMP_PROTO_VER7 firmware delivers a per-IOD / per-CCD blob=
 (struct hsmp_metric_table_zen6, ~13 KB) that does not fit the existing per=
-socket struct hsmp_metric_table and does not fit the existing sysfs metric=
s_bin transport at all, since binary sysfs attributes are bounded by PAGE_S=
IZE. metrics_bin also has a long- standing tearing problem: userspace can r=
ead it in multiple chunks and observe an inconsistent snapshot if SMU refre=
shes the table between
read() calls.

To address both, the series:

  - Adds a stable UAPI description of the v7 metric-table layout
    (struct hsmp_metric_table_zen6{,_iod,_ccd}) that mirrors the
    firmware blob 1:1.

  - Stops hard-coding the metric-table region size in the driver and
    sources it from firmware (HSMP_GET_METRIC_TABLE_DRAM_ADDR args[2]),
    falling back to the old size on v6 firmware that leaves the field
    zero. The same size is used for ioremap() and for the ioctl
    bounds check.

  - Adds a new HSMP_IOCTL_GET_TELEMETRY_DATA on the existing HSMP
    character device that always copies the full firmware-reported
    table in one shot, removing both the PAGE_SIZE cap and the
    chunked-read tearing window. The trailing reserved field in the
    request is rejected if non-zero so future kernels can repurpose
    it without breaking deployed userspace, and user-supplied indices
    (sock_ind, msg_id) are clamped with array_index_nospec() to
    mitigate Spectre v1.

  - Wires the ACPI driver to populate the DRAM mapping for v7
    (currently gated on '=3D=3D HSMP_PROTO_VER6'), so the new ioctl path
    is actually reachable on Family 1Ah Model 50h-5Fh hardware. The
    legacy metrics_bin attribute is preserved and continues to work
    on v6; on v7 it returns -EOPNOTSUPP pointing at the ioctl.

Around that, the series also:

  - Adds the new HSMP message IDs (0x29-0x2A, 0x33-0x3A) introduced by
    Family 1Ah Model 50h-5Fh firmware (PC6/CC6 control, CCD power /
    thermal monitoring, DIMM sideband access, floor- and SDPS-limit
    control, command-enable discovery) and converts three SET-only
    messages (HSMP_SET_XGMI_LINK_WIDTH, HSMP_SET_DF_PSTATE,
    HSMP_SET_PSTATE_MAX_MIN) to HSMP_SET_GET so userspace can read
    back the currently programmed value via bit[31] of args[0].

  - Relaxes validate_message() to an upper-bound check for every
    message type (HSMP_SET_GET already did this). Existing userspace
    that asks for fewer response words than firmware now provides is
    no longer rejected with -EINVAL.

  - Tightens metric-table read locking with a per-socket guard(mutex)
    around the SMU-side refresh + memcpy_fromio() sequence, and
    reorders devm_mutex_init() before devm_ioremap() so the
    "metric_tbl_addr !=3D NULL implies metric_tbl_lock is initialized"
    invariant holds on every probe path.

Documentation/arch/x86/amd_hsmp.rst is updated to describe the metrics_bin =
/ IOCTL_GET_TELEMETRY_DATA split and the protocol-version gating.

The series is bisect-safe: every commit was built individually and checkpat=
ch.pl --strict is clean across the series.

v3:
https://lore.kernel.org/platform-driver-x86/20260517151211.415627-1-muralid=
hara.mk@amd.com/T/#t

Changes since v3:

  - 1/7 (new HSMP messages): Tightened the inline bitfield comments
    on HSMP_SET_POWER_MODE / HSMP_PC6_ENABLE / HSMP_CC6_ENABLE /
    HSMP_DIMM_SB_RD / HSMP_DIMM_SB_WR / HSMP_FLOOR_LIMIT /
    HSMP_SDPS_LIMIT. Rewrote the commit log to spell out the
    backward-compatibility analysis for bit[31] of args[0] on
    the three SET->SET_GET conversions.

  - 2/7 (UAPI structs): Added per-field comments explaining the
    num_active_ccds placement (in the IOD block, matching the
    firmware-side aggregator) and the ccd[] sizing
    (HSMP_F1A_M50_M5F_MAX_CCDS =3D 8, hardware maximum, userspace
    iterates [0 .. num_active_ccds - 1]).

  - 3/7 (response_sz): Rewrote the commit log to motivate the change
    in terms of forward compatibility of older userspace against
    newer firmware/descriptor tables.

  - 4/7 (firmware-reported table size): Rewrote the commit log to
    document args[2] semantics and the 0-fallback path that keeps
    behaviour identical on v6 firmware.

  - 5/7 (HSMP_IOCTL_GET_TELEMETRY_DATA):
      * Added array_index_nospec() on req.sock_ind and msg.msg_id to
        mitigate Spectre v1 on the user-controlled ioctl indices.
      * Rejected non-zero req.reserved with -EINVAL so the field
        stays repurposable.
      * Tightened the UAPI struct layout reasoning under the
        surrounding #pragma pack(4) and the size-mismatch handling.
      * Trimmed the long implementation-detail paragraphs from the
        commit log.

  - 6/7 (enable v7 on the ACPI driver):
      * Restored the legacy sysfs metrics_bin attribute (it was
        dropped in v3) and gated reads by protocol version so v6
        userspace is unaffected and v7 userspace gets -EOPNOTSUPP
        pointing at HSMP_IOCTL_GET_TELEMETRY_DATA.
      * Removed the ABI-break paragraph from the commit log now that
        metrics_bin is preserved.

  - 7/7 (guard(mutex)):
      * Reordered devm_mutex_init() before devm_ioremap() so that
        sock->metric_tbl_addr is never published with an
        uninitialized metric_tbl_lock on the non-fatal init_acpi() /
        init_platform_device() error paths.
      * Rewrote the commit log to document that ordering invariant.

  - Documentation/arch/x86/amd_hsmp.rst: Documented the metrics_bin
    PAGE_SIZE / protocol-version constraints and the new
    HSMP_IOCTL_GET_TELEMETRY_DATA path, and cleaned up whitespace in
    the embedded struct snippet.

Thanks,
Murali

Muralidhara M K (7):
  platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model
    50h-5Fh
  platform/x86/amd/hsmp: Add UAPI structures for Family 1Ah Model
    50h-5Fh metrics table
  platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
    check
  platform/x86/amd/hsmp: Source metric-table size from firmware
  platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table
    reads
  platform/x86/amd/hsmp: Enable HSMP_PROTO_VER7 metric tables on the
    ACPI driver via the IOCTL
  platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)

 Documentation/arch/x86/amd_hsmp.rst  |  30 ++-  arch/x86/include/uapi/asm/=
amd_hsmp.h | 294 +++++++++++++++++++++++++--  drivers/platform/x86/amd/hsmp=
/acpi.c |  23 ++-  drivers/platform/x86/amd/hsmp/hsmp.c | 169 +++++++++++++=
--
 drivers/platform/x86/amd/hsmp/hsmp.h |   6 +-
 5 files changed, 485 insertions(+), 37 deletions(-)

--
2.34.1

