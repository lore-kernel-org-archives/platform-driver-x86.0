Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219664;
	b=15sAVllkEMyurZKb/VYF0qfWXFv30GAPnSWg8veLfQdqqFhSr4/amPWTAXYn+nVI1ahL
	 E0Rrtiah3XkuhPjwsu6B4sVPhAx5qztdZvFOWhAcSVfJp+961ZERZM0eLg2WV61Z6tm39
	 zgZ5KEKcVVvEj8/sHeMIq0Ut/hcuv4ylqDg8aF8UuEaVKeUOTIMU3ED/KRu/Spr6M7nES
	 MxB+kW7gL8V+1k2+fZcps2TNDgZwFkK9r99zQpYB2wKB//uOKfiAyrOONbyyFCB13Rucn
	 AJvD1LF7MglKx/QktTfaa/5V38EOklHi4NtcHkiJ2EVWa6MipC0FKPuEzrL8hXWe4jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219664;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PqiPqb4oTcJedb9oVCQx37PK5UqQ/VLv5I577QLTMI0=;
	b=15yLuNQl22zg4X43Ceb3wEz42d0vXUKMd3Z+LZseSYILb7ey9FEbmoc53tcHjyc+SRO+
	 B85BN9UjCiZUW5lKjDhUhiCMLZ0IJ9iNMiEuMZT/RBoG1lEulLO4pUCLcxWou2G5yAH5G
	 qQnFllnUqe8MW0dwFznOMqT1cBWPnOxojaNBDzZ1KSa8Cr/Sxz0xf4wjEaz1ihAAYfIwc
	 xipaCu6uoGYTldgJ5NTL9//hX6YfrdHbvwT5VBaDJNTXCHC52NEkI0SKA9JpNPSvKiUMp
	 ZCTRIRnA6FzzgRR7aQ5uHfTptZbe0bl5tPTGY6lwMRWPiKZewgpOe2uE6Sfw4OwwOvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="ENr/VQq6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.0
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7FC606A695;
	Sat, 21 Nov 2026 00:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B7FC606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ENr/VQq6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvVRnrt4ESbYHG7ZUdlQS2JkUtAS4LoKYCcWjXtSXq5Lz18kcy4VY73G9YZPZdcQD4oYhFNd/p+TqFhAEexLkT5rq7plk5yLxiBJ4Mxq5VPtfeOMy9Kjl2JmglzF5tI3r6+QgOkQerdQYAI9EpGCPzqCSH7aSJs2w1SrpllKxrVhOitN7o5iq4CPrNVsb47piR5Qd3qjfndeMkcrgyxGYdRs1eQS6DljROedaE5DgGAD/5Z7kpLfha7Bc69OW15gCGiba4mf9dQHRgspx+P6XlW1L1QBC5XhdRBBxjAdCnCsnZPfLVpbwxYCwmxoOpK6W1gMZDO+vx8kHvpuREImoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqiPqb4oTcJedb9oVCQx37PK5UqQ/VLv5I577QLTMI0=;
 b=dH8GqxlfCk0+5yjKAutOrjQPQaQUplg+FyGSBTiZAy476SCu6iuJOZ5BbSjsOYvrAJlTqxlA4qPrIWIbJlS5XN04p12ZcFlQWzU3VhCFkA4oHnF52WgmtgVW8di4vM8Wo4Fgk3RsIlYT+JS43BbZlRli2HdbjP0erLsv/JaCAdJSWHsOwIGKROD8EJD2GObllTO5dKm1nyjotnfd8MqINpypR9/YCHRE6bHOY2HHNxO24Cn4I+6Uq21BgVOKxo9v0AZ5kOQTDMVkXKOX3QGnu3/1cxsn5ugpWfvh4SycoEDCls9coVoLN2Y7SEPh3PTjkWQWjQBTUyVcksR2e22xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqiPqb4oTcJedb9oVCQx37PK5UqQ/VLv5I577QLTMI0=;
 b=ENr/VQq6UUvJJq8OjsEx3aL1lFngmxx81jBBkLsF6VbPvOIhlrEg5RGmawJKq4C/6nEpYGoa9bvO64IXSe4ZtpLHtYwOIaQyBZiS6wXnsOTQkxYDd+KblY4Fd61ZWm5l+uzmUi/G8Hj+gJ4baO73nM/NZP8FTLWum96LZpZWLKOBiXB9/9qce0j5sMNtOOdgc9lF+eNUCLy3rp4eQBbS3m5pv+MiOTqiJBm5zjCMaZ1QfEt0nRw9h3/qEwA5e30Ua9BIm8lvkbf5NKlvtqLbL5dVyUHffTqZTMvfP93Ec1IpRQDQDduFqQeVONpsQUoc7BJICCeH0G1js2IqfBimTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:07:40 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:07:39 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH 0/8] platform: dell: Move out of x86 and support Dell XPS 16 Creator Edition
Date: Fri, 20 Nov 2026 16:05:46 -0800
Message-ID: <20261121000556.173028-1-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 02df6193-a968-46d5-002e-08df476374cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|6133799003|261009223027099003|261021121427099003|5023799004|11063799006|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261026121527099003|261102130727099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	qXezYDiA5ApdurI6vca701TQn4QDPSa07fG+ceFtFD3rjQdKEhnylQzp5Tb4T+OqylM4kIQ2j9BE29tizgdNn7mfPtnG4Cpv4fLNeh76wq9YJt/2AZgcrNGVyXtG8ysAOSZIvVNMvCrm3jZxi2KamKEENDr5xQgRvnxffSfxaH8AIHVbnGiDP76hD3bcXZdEL5pI/wlFDqfzMcHPmSy4SM1j+yAdPH6ZwKNeP219YHOenAgYYGejrfFoPzd/qcWzW+xfxz8WCyOvmByVqVhhjBK6jfKMsciAMXu+Y97L5DVvNyNanRanFx6Cy5Mlc3E9NV4ZRbz43eKTv+9/wZdeOj7g2JTRT55n+UVQOkXYLmV5evvlcQj+KBh9uWKqxv+nSVfARhcbNBY+kxRc8eynSNo30y3XdQ9rNkOinIiZzomiS1N9/ljBnHfOByf2VgMTZO/Q8ykclqDCxwIVcUqYEeTLJ6OlpL87zLUNBJ0tbzb2hfXN/s8zZH7xPBii/qUt2vVXmV29+oYD4sjA72pEu75vEAI+zzqWJdFV5eGQgw2Bnz3qiVrDF+o7A7wLz6N866bKZuTDU2+nH0YAb+Ywg9TeTPeMF4dWY3jjAD+79bKHUj68ZdC2cNyJA1TdSXXXKtHkqOgH8BDz21pbBfjgeud5kRXN27V917LhxrmfoJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(6133799003)(261009223027099003)(261021121427099003)(5023799004)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261026121527099003)(261102130727099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9gC+shtPBwm+C27SyJov0ctr2iprxEnz3aRZyKQTdegiZNU53LgyeJiSuruO?=
 =?us-ascii?Q?fcGN4o0IcIkgQEMYT0pw4ltA/JaOCkVjJ+l2AM6fCFY+DXff3t5uJ+cjhDvL?=
 =?us-ascii?Q?4Fk6fSQS3ND2q3CmtuiR039OgJ2KppRPUZk0LEC6tokSvr7EGxHSvncp/Qr1?=
 =?us-ascii?Q?FLF4KXji9LlcgRU6dU3DDmkVAfivpEHJgdxhU8WNtkeJ64k7LT9eCHR2neaT?=
 =?us-ascii?Q?mQoEuM911PtTn92y8S+T0HqeAv7ZOAAHe5cUSvGXfjNWfIyYC9q+lzOiBCui?=
 =?us-ascii?Q?eMsDMdy0SbJth35ilYDmQr09cFqMf8+2MgWVttK7RrbFoMvaCvT9g6jqnyiV?=
 =?us-ascii?Q?E0siKcsAAIa9qYMQW2mrISP3ebcMQxTpmd0Q2BbvaO7Amz+yV8x4wheLnugS?=
 =?us-ascii?Q?22n9xPMBoHAzXrtI48TShWKpF1j8CnV2oMWmDMUamMMaAY6qz4yINNzyGbId?=
 =?us-ascii?Q?NekUcvsDCIp+deCs9Y6uux9PPyQR7tsCsdu+x8XWyzdwZRu5XSIUELCek2Z7?=
 =?us-ascii?Q?kX9/A2ISWOA4ueyFC6rWM1XkmK/8iVpP+9yX6CkLiaUN/SEumHD9GzcIxh4j?=
 =?us-ascii?Q?JWdAP3CtMtI4BjILkLzrcJVNPfpiCRET+afig/4rP0/+mxJjO/kR+YxI7vx3?=
 =?us-ascii?Q?tekYHKc8MayRnMk2OOWIBIk3MhL+nIST8R1rZyulS7gb1AUn1QNooP5u/KuA?=
 =?us-ascii?Q?ei3f0CPGMfBitynj35y9a0ss4YDyim4S+rRnKJCbKSQ7/9NLOaiRPDkB51gK?=
 =?us-ascii?Q?MjIcNelTd4fuKEgtTQ9MbjkoPouMhfGoRyVzPKvuNPKp/HPJiRPGG+0eGsOy?=
 =?us-ascii?Q?7vLBq/yoqONZ04//6Cy+v9Nh5LdnNFL5x+sDOppBueM2PXUQCYktGJLwakk/?=
 =?us-ascii?Q?iK9bLolAo27eao/l1NAuMwKNlkj7t/6RrsmNQszFMWSzsOylaKA0UNY37Koj?=
 =?us-ascii?Q?kTpirECCUnHPH/2u0SVcWyO/04s8hZvLbWlWM6iW87m2ZGBKr2GrxhU26Ndn?=
 =?us-ascii?Q?+2dQfOiOnaO6+b+TsPbH1GpAZHZXAlCMwlEmhv25Ob7iPt6yyznDWYiGPjdM?=
 =?us-ascii?Q?MzGR6KM9rLlG/i0xEgmvKxqILe+E2ENd8gZVX58xqwAHhDuitxl3YyUhpXbJ?=
 =?us-ascii?Q?kyZtWH90PRX392PnvQrBTm0ECWiEopmiMReVH4fCLOmzxLjrWgrwXrBBLfwU?=
 =?us-ascii?Q?ryYdncX+4hM7xzcXV2c1z4FIBwlzjwrOUi+wPQf33YPFWNmiwFIxCGJ2RDIP?=
 =?us-ascii?Q?hFK1je87+WdvVqwWn1BYE6BEgEIdcLo743QXmSCnfJ07pKu4BubCnBwXIpQX?=
 =?us-ascii?Q?S0u8LvS+KCr2HQ+SzNiYo/W+U+s1phn4MA5ArDIVJGm6joXPd7iJt8uVU5hG?=
 =?us-ascii?Q?a+TjlmyLcyyjc/Qwcb5I7GP1QdRsM5wUaNFhqVwCVkFrm6oiSfCyCL7DwHep?=
 =?us-ascii?Q?m2qwbgbIXGpZrU9Wky9S8h5FujMnxoUDlzfkxzojbrVZMsTBDeS7ioLjI5wi?=
 =?us-ascii?Q?YjUsCm61Am1CqvRtilH9jsFIayfltfalBy0AWnpdqDny2kxifkzlbHdUDqpr?=
 =?us-ascii?Q?1SOTsXEI+e8pgss2POBjq2vnpB6BvxtD1slor6PqvZSmbTZnhipe2bgcUF7y?=
 =?us-ascii?Q?3UqL1VXxw/wCutPybVmhiMNh+lmuwdrcewKH5EU5Y8cpLs4PdyYy6aB2XEvS?=
 =?us-ascii?Q?4llYXERgVYlrf1n3JE2YkWYaWhO2Pf7xXO1IT7nAdx93Kp0u8wkmdKiHzJVB?=
 =?us-ascii?Q?iilX3Yru+A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02df6193-a968-46d5-002e-08df476374cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:07:39.8578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSyZ49LilXqRlN23585uKbugrsAqYbv7g5w9wGWJxWJiTzNFXTohjcIIR9Y8+K/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

The Dell XPS 16 Creator Edition (DX16263) is an ARM64 laptop based on
NVIDIA RTX Spark. Its firmware exposes the same ACPI-WMI and SMBIOS
interfaces as Dell's x86 laptops, so existing Dell platform drivers
apply to it as-is. Today, they live under drivers/platform/x86/ and are
gated on X86_PLATFORM_DEVICES, so they can't be enabled on ARM64.

This series moves the Dell drivers to drivers/platform/dell/, makes the
ones that work there available on ARM64, and works around some firmware
quirks found on the Dell XPS 16 Creator Edition.

Patch 1 makes DELL_UART_BACKLIGHT depend on X86 before the move. The
driver relies on the DELL0501 handling in
acpi_quirk_skip_serdev_enumeration(), which only exists in
drivers/acpi/x86/utils.c, and on drivers/platform/x86/serdev_helpers.h.
Without that quirk, no serdev controller or platform device is created,
so the driver wouldn't work on other architectures.

Patches 2-3 move the drivers to drivers/platform/dell/, rename
X86_PLATFORM_DRIVERS_DELL to DELL_PLATFORMS (keeping the old symbol as a
transitional config so existing .configs carry over), and add a
MAINTAINERS entry for the new directory. The per-driver MAINTAINERS
entries are updated to the new paths. DCDBAS, DELL_RBU and
DELL_SMBIOS_SMM keep their X86 dependency.

Patch 4 makes DELL_LAPTOP's SERIO_I8042 dependency optional, as there is
a fallback stub, which returns -ENODEV.

Patch 5 fixes dell-smbios-wmi probe on the XPS 16 Creator Edition. The
driver looks for the misc BIOS flags (SMBIOS type 0xB1) only at the
hardcoded handle 0xB100, but firmware numbers it differently. Handle
0xB100 is still used whenever it exists. Otherwise, the driver falls
back to the only type 0xB1 structure, if there is exactly one.

Patches 6-8 handle a firmware problem on the same machine: the SMBIOS
calling interface completes every request to the Dell-proprietary
interface with all zeroes, even for requests that should fail. As a
result, dell-laptop reports bogus battery charge modes and thresholds
and registers mic mute/mute LEDs that do nothing, and dell-pc fails with
"platform_profile probe failed". Patch 6 adds a DMI quirk list and
exports dell_smbios_calls_functional(). Patches 7-8 make dell-laptop and
dell-pc refuse to load on affected platforms. dell-smbios itself still
loads, since dell-wmi depends on it.

Testing done:
- Build-tested x86-64 and arm64 with all Dell platform drivers enabled.
- Runtime-tested on Dell XPS 16 Creator Edition. Mic mute key is
  working.

Need help testing:
- x86 Dell laptops/desktops for regressions.

Outstanding issues (outside of this series):
- When spamming the keyboard backlight key, then pressing the mic mute
  key, the mic mute event is spammed. This is a multi-part issue between
  the EC and DSDT. I have a DSDT patch to fix this. I will be working
  with Dell to get it resolved.
- When the dell-wmi driver is not loaded and the keyboard backlight
  button is spammed, it will eventually stop working and FF-A
  notifications stop firing. This is likely an issue with the EC's event
  queue filling up and not notifying anymore after being full (since
  there's no consumers). I will be working with Dell to get this
  resolved too.

Brian Mak (8):
  platform/x86: dell: Make uart-backlight x86 only
  platform: dell: Move out of x86 directory
  MAINTAINERS: Add Dell platform drivers entry
  platform: dell: Allow DELL_LAPTOP to be arch-independent
  platform: dell: smbios-wmi: Fix probe on RTX Spark
  platform: dell: smbios: Add quirk for non-functional calling interface
  platform: dell: laptop: Don't load if SMBIOS calls are non-functional
  platform: dell: pc: Don't load if SMBIOS calls are non-functional

 .../admin-guide/laptops/alienware-wmi.rst     |  4 +-
 MAINTAINERS                                   | 36 ++++++++++--------
 drivers/platform/Kconfig                      |  2 +
 drivers/platform/Makefile                     |  1 +
 drivers/platform/{x86 => }/dell/Kconfig       | 21 +++++++----
 drivers/platform/{x86 => }/dell/Makefile      |  4 +-
 .../{x86 => }/dell/alienware-wmi-base.c       |  0
 .../{x86 => }/dell/alienware-wmi-legacy.c     |  0
 .../{x86 => }/dell/alienware-wmi-wmax.c       |  0
 .../platform/{x86 => }/dell/alienware-wmi.h   |  0
 drivers/platform/{x86 => }/dell/dcdbas.c      |  0
 drivers/platform/{x86 => }/dell/dcdbas.h      |  0
 .../{x86 => }/dell/dell-dw5826e-reset.c       |  0
 drivers/platform/{x86 => }/dell/dell-laptop.c |  3 ++
 .../platform/{x86 => }/dell/dell-lis3lv02d.c  |  0
 drivers/platform/{x86 => }/dell/dell-pc.c     |  3 ++
 drivers/platform/{x86 => }/dell/dell-rbtn.c   |  0
 drivers/platform/{x86 => }/dell/dell-rbtn.h   |  0
 .../{x86 => }/dell/dell-smbios-base.c         | 22 +++++++++++
 .../platform/{x86 => }/dell/dell-smbios-smm.c |  0
 .../platform/{x86 => }/dell/dell-smbios-wmi.c | 37 +++++++++++++++----
 drivers/platform/{x86 => }/dell/dell-smbios.h |  1 +
 .../{x86 => }/dell/dell-smo8800-ids.h         |  0
 .../platform/{x86 => }/dell/dell-smo8800.c    |  0
 .../{x86 => }/dell/dell-uart-backlight.c      |  2 +-
 .../platform/{x86 => }/dell/dell-wmi-aio.c    |  0
 .../platform/{x86 => }/dell/dell-wmi-base.c   |  0
 .../platform/{x86 => }/dell/dell-wmi-ddv.c    |  0
 .../{x86 => }/dell/dell-wmi-descriptor.c      |  0
 .../{x86 => }/dell/dell-wmi-descriptor.h      |  0
 .../platform/{x86 => }/dell/dell-wmi-led.c    |  0
 .../{x86 => }/dell/dell-wmi-privacy.c         |  0
 .../{x86 => }/dell/dell-wmi-privacy.h         |  0
 .../{x86 => }/dell/dell-wmi-sysman/Makefile   |  0
 .../dell/dell-wmi-sysman/biosattr-interface.c |  0
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  0
 .../dell/dell-wmi-sysman/enum-attributes.c    |  0
 .../dell/dell-wmi-sysman/int-attributes.c     |  0
 .../dell/dell-wmi-sysman/passobj-attributes.c |  0
 .../dell-wmi-sysman/passwordattr-interface.c  |  0
 .../dell/dell-wmi-sysman/string-attributes.c  |  0
 .../{x86 => }/dell/dell-wmi-sysman/sysman.c   |  0
 drivers/platform/{x86 => }/dell/dell_rbu.c    |  0
 drivers/platform/x86/Kconfig                  |  2 -
 drivers/platform/x86/Makefile                 |  3 --
 .../x86/dell-uart-backlight-emulator/README   |  4 +-
 46 files changed, 103 insertions(+), 42 deletions(-)
 rename drivers/platform/{x86 => }/dell/Kconfig (95%)
 rename drivers/platform/{x86 => }/dell/Makefile (93%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-legacy.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-wmax.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi.h (100%)
 rename drivers/platform/{x86 => }/dell/dcdbas.c (100%)
 rename drivers/platform/{x86 => }/dell/dcdbas.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-dw5826e-reset.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-laptop.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-lis3lv02d.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-pc.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-base.c (97%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-smm.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-wmi.c (90%)
 rename drivers/platform/{x86 => }/dell/dell-smbios.h (98%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800-ids.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-uart-backlight.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-aio.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-ddv.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-led.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/Makefile (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/biosattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/dell-wmi-sysman.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/enum-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/int-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passobj-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passwordattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/string-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/sysman.c (100%)
 rename drivers/platform/{x86 => }/dell/dell_rbu.c (100%)


base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

