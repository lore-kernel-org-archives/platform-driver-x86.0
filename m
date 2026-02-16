Received: from MI2P293CU003.outbound.protection.outlook.com (mail-italynorthazolkn19011031.outbound.protection.outlook.com [52.103.57.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A0D247DE1;
	Mon, 16 Feb 2026 01:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.57.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771203731; cv=fail; b=aBgiENHj+HJd1YzcrMl7K8KXnDlmmR+vnL+tmSh9N6dl1FtV36a8yVNGnqWQ+KABJbcuOd0cUCSl3LZYZExPHbnig6ZPDwkmxkXX29g6+DUECj4uomDZYogbmV6doJ0DY/A7G8LPb5uKMFytqqpISCJzi/SCzAj2fT5O7mdQ4Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771203731; c=relaxed/simple;
	bh=MV0KL46xDzf6ODZeXG3NvyXJtuC5D+8nLvTK3BTcTiw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hd80+X441dg1LqFYZYbEKv/jrVfkkngGhPbRVuc5Rd7jjvqWMzXfUXVGZvkgR7hdXmJaD0NDM1WgtuYoq3jQ4dt6KjcmK+5D8loqCYlAnBL7I5RQ8CzJ1KZUl+wUb9cSXXAfiL+4Vx766aNDtFZ+Z5ku0akLwblW0JliI7TDLfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=X52D2Yy0; arc=fail smtp.client-ip=52.103.57.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="X52D2Yy0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUFE1cTJSk0JT/x5B9z5eTyamBCFJCt/MIUbFTRdULDm92nxbIwguyKQqZBnT2D3FmiCQ+527aR7aU5VVrnL3W70G8eGUiyki8uNQS6LIKOC2OyCqrLOrWfJfFy3kuVr/iud1H4uY4+gRjqRMy6V0rpSoUdAJ9K1jTIMBuocp0KLXNyBoZjmc4yIh/UeH0m0pTx1SpWS7vzpN12rTuuEvySRQolLh2eKmQ+ubcirzjT3UcdUMhrf4ugoeh2QoE4Yr6OEv9CS0sTZFgpW9NRVW9I9z+68Cf1C6OStxvKMbplZ/FTaQEdCmn7dOZQNQH+C0mz7iWczpYxeMzyNUz1+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQBm6sG0jnj+bBUXfA0wZrjkPtAG+61X2l1FzWlTjEQ=;
 b=xipdP8fNj+tJVz3acdQY7kBe9zi7OBzGykoxbHBr99SxbIamHOGu30UUYxh9hHg6k4kcWintcC5cGNfvKjGXAbc+JkdwsANH6yc9rCrvyukmq8VkouTdQIyq8g3Fz/Tp1kdGphHwBMmM+Ks2wglMelxpCMAetT6AZJ9iIMCcMVA67nC/LXrxhXozDlOcMyGNIe6jsYgx9ziiCz2jPVKaAPxKn6TG1l9mcezIAAMNpXgP9ON3sRoplU7ISAEYOOxDuJSzhIIkyUZ/X0kowBHEuPylHVBfkCcjq/TeJREkMyHp5TUl7CWm74fCXC75wHESDdqi/zAlnDfEqSaXWztFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQBm6sG0jnj+bBUXfA0wZrjkPtAG+61X2l1FzWlTjEQ=;
 b=X52D2Yy0eOxxs34FZxLGqOwe4x/vMkanHxTK01deKrh79qLKbulsElTk8r3QbbBMWk8LRjqgRdHNuZ7gnDcZ582lAk3emWUjxyILXAl+1pyX5yBZcKjXtOP80C4HZfjRjugrY4H1cHe8im//czDqJT4rkRGWt5mbqbPjAvnoaY/r0j74vg4klt5gu9sTD2+376NoKmRLQ5VQl2nn/fiq114WjZs2Kdf3gpctPVMgs3FQiJGXT6/VoThrN4t/FSxnFbAhzTcFgAzRK/Dr2Yt3kCveUeA+IRYMV5EtW2P6PA8ezaZbxm2U+zYL27PQeVkkMsMgFVYYnBNrc4xSHKOZYw==
Received: from MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:35::13)
 by MI2P293MB0038.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:46::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 01:02:04 +0000
Received: from MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM
 ([fe80::216c:bd43:f2ac:c3db]) by MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM
 ([fe80::216c:bd43:f2ac:c3db%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 01:02:04 +0000
From: Jonathan Teh <jonathan.teh@outlook.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Teh <jonathan.teh@outlook.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
Date: Mon, 16 Feb 2026 01:01:29 +0000
Message-ID:
 <MI0P293MB01967B206E1CA6F337EBFB12926CA@MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::8) To MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:35::13)
X-Microsoft-Original-Message-ID:
 <20260216010145.19264-1-jonathan.teh@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI0P293MB0196:EE_|MI2P293MB0038:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e94e43-b898-4112-29b4-08de6cf6ff92
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|15080799012|23021999003|41001999006|8060799015|461199028|5062599005|5072599009|12121999013|39105399006|10092599007|10035399007|440099028|4302099013|3412199025|1602099012|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lROiQE2yDwGEmMriXBWcAkpbSKXkG7p2Zua1d9N/4XDXaigLcOCg+BQxfIMw?=
 =?us-ascii?Q?GgM/APJzYUj0o1tFnMz5aRc9Dh4a0/Ehbq8pPrPNnIdcWCC0sRfKImz9KLja?=
 =?us-ascii?Q?qqM/QBDNbRZys2KZqfcLjSnoUy9QblbW6RrJuRTyOhIdcNI2yBXJKb3doJ2z?=
 =?us-ascii?Q?smMYZKmyDy+4MCYVfUS5z47DcJY79aWrx0Cwr/ema2Uqug0fwT2y39ID+l/h?=
 =?us-ascii?Q?Ki1GGIG9soy0rUHBIDJ5uQmep5s2SccZ83O0pk7Dg2t1PXtXmV8ZXHzGYZA3?=
 =?us-ascii?Q?EVPtV2NOTxFsewcm24o+jkEOow62QGKZ5zpgqzlfYwUHrwY2NdMt40gvnOT3?=
 =?us-ascii?Q?btQj6aEHOTwzJjeO+/XjmLYzFd90zV/c3oHAO7jYeaej/by5TS0AnoNOy+iF?=
 =?us-ascii?Q?+Ovje55jUqY9IXssm8OrgV6A8uh8GDcfMTxUSTd2Njrlaita+lyLFPRK1zUo?=
 =?us-ascii?Q?OpmzDTY4TGYhtja0qyzvW+leM37/W72ZfCy3CAFvbkP8nCH4207qF9FNFzkC?=
 =?us-ascii?Q?j40sNA+ys3jdcvSdiHsHLDmdAVXDlT0ww8MM+TjEW/VQ9kC9Yv5/i+OuQJgj?=
 =?us-ascii?Q?hhPZxx47nI2YFhw9ZzBug6D6Ok6H1gHZWan5MfdhudRir9XKypKe3SNaCnWH?=
 =?us-ascii?Q?O9yeqjQV+GrDO8wHnLM0UF2BcEhWqjpvETKXAnHUj/cq/OmQZcsMB1wZbg8n?=
 =?us-ascii?Q?y1lAWSmNPosRDhPMIT0wv4dinWrT6jWUpyAz2IcFobhwnJB7g31TPAWMoc/r?=
 =?us-ascii?Q?oLMYHwosHhkS2oBqfCWAQJrxdG2sHkR8zK6az7LjNFLDYUwSw6yi+SNYqJnW?=
 =?us-ascii?Q?WTKTbBP+GaeYUXnm5TuvZne4qRPurx3iV8tgbZOhuxcvV4iCXZpWLtTjxO2/?=
 =?us-ascii?Q?tlalhbJEOXF8BvAv/NbzIAsVn1bXFr3bviva0ZA+MZ3mMVrA9DJriWa5y8XP?=
 =?us-ascii?Q?opZrrV6gqsdSIcxKv/9eH6tF6ZreGf4prIfT9RdUo9+Rt5NgR8paBWi/K+yG?=
 =?us-ascii?Q?AKZd+507vGYYO9SSidDlYzEC5IwL2kZm8muQOSQIh0ll379m0UxtKcR+f+93?=
 =?us-ascii?Q?rxpwJUt4fQJJb3TzQPEgyjfjB2uNjU5D/Z/o1noYrkss3HkYGFB/bPdQn5cP?=
 =?us-ascii?Q?DuoZzkzFGLX3426EvCqllYpnwRHCTPdUqqNiotFv+Ax9co/vbABFOoyiXBDD?=
 =?us-ascii?Q?jACncWm3fRmxrzpS/kjtNSiLdkUSclQoE1VVysbtUnbep+wfLEx/o380kdjz?=
 =?us-ascii?Q?lqphZaRhkipEoY1hnfn9Y1uRaMVNkyiUVz5I0iZSaicvU4EoilLA4r1/pZRz?=
 =?us-ascii?Q?nUz+sTvSTcgo5nZ6NRxJMUPhXr0WC+KQoEySvBg+8sppyIS1K5UAo5D07rCb?=
 =?us-ascii?Q?yQsNk22nS2lQ7iwXYk7syNcoBlcVNPfmbBYbST1SudwVHPiNkGBZGX6dDDRm?=
 =?us-ascii?Q?lzKdqBVWv5o7vvZPzm9LfJws1wbKwXqhrzfT+KlL75V8iWEyxuDHVQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oDpwtX67VKt46edVQid7znMO/8GVuJ/TlyJLX1L+e4xvbWOxFR6TVVgfRC0P?=
 =?us-ascii?Q?L/C+fLK1sYk/DUkkiK2dp4kXS6sangTLQu3h8I1Ps/9yH+pgm4foIVez2SNK?=
 =?us-ascii?Q?6BdH2lnLYHVAiYinaJNuLtL/RL9Nnxg8vxfVE4SnmTZqCl+Yen/VOtY7A9jl?=
 =?us-ascii?Q?5GRIvpZnBqIaj/KQsBMHG+VaefKvOLtnUi3g6kvvk52+arfd8OzyUrjj1tCg?=
 =?us-ascii?Q?t2O5ty5mxr+gIPTvNQV8DqSjfsjbxeiW2TrYa9/KF+hYUSQZEJCU1EgOKQC/?=
 =?us-ascii?Q?1C2ME9p83dd2/MTqzBTvYvtnOqCfsllYEKEYIxaIh15kKkLYfoARo54Itwaw?=
 =?us-ascii?Q?Th0Wb5vJe27F9D4aaiNWCYKIYD5RchJ0yXAw0I3vEe5JZStcUss89owU7tBe?=
 =?us-ascii?Q?9nZRyc3F7QNZ2sKd1JFIGOgRo6nX0xpyZJv777ypVb2zpxCHa+jkfbFdJs5U?=
 =?us-ascii?Q?BTpwy1sMsR6gTPxMbj90zIAn8hcszw0uicZV3bfOwmi6n7F89bNb49KXTrV6?=
 =?us-ascii?Q?mgWS2R4EDZWU9zS3lmmBXLTIv2Pm2p0YOGsmAve6BPNVjJrvpwJKHobTvK0a?=
 =?us-ascii?Q?LxGrqAcVrwaiITFWQms+4qcS0aTZybw6myoLmkQ8CzGnBTD82/4k5i6/F5TN?=
 =?us-ascii?Q?peMw/7n3mCar39I4OplNd3XNvbkEutDvbihVRG2tOqY4pvNEyLc3a6DTewSZ?=
 =?us-ascii?Q?emR+RjO7YwHBk0fB6GJp5eHJCV7RggbArUua/seuB/Hm5Xfn3CuJ6dPkr/Aj?=
 =?us-ascii?Q?Lfxtw3eU2yZFTC24bvnJ88xHRx2BDtvwWvQHM/zFmJzAf49+UCrw22I4xiF9?=
 =?us-ascii?Q?OkQ3kU54cYOkxD9y5IE1VDZ+htPlP35HIo+d8KOnIiz52/actQ8PchdLFlcb?=
 =?us-ascii?Q?J9VbpP4W3k6Hhej3hIqHeWEmD3+Fn3GtyUHWUlywQ1+0JE7vF/LfCHctsj1v?=
 =?us-ascii?Q?osq1u8WEYfJReCNHKXW4gpOucBRmzqi37R0KySy+baJqU96lc9MyQKB2JeVS?=
 =?us-ascii?Q?0omu3ezbBIuRcmAJi4NuhrV3bqwzHUvJEkh7mrjxFwh/ypMb+HZcMsEynWRi?=
 =?us-ascii?Q?1tKkXy35ZF1BvnmKpwkH0PZgHit8OozmW4Ng8cVj+u8pMPykKZutFIW6R+bN?=
 =?us-ascii?Q?BRYhSC4ycHb9VAKWLOOsRlfVHbxBks9a+T82yxGdVQKoWNOt+R3HQd72z/om?=
 =?us-ascii?Q?/p/3AZsAYuOS1oizLWNA7YhG5T3CoAxsK1Ui3cnwEzPImhNnhBpDS72qOOAN?=
 =?us-ascii?Q?u+yQapEpZ6wTOyVBehJaK05CPBVZme+VmNvkhBXO8qDkmfUB5eYKSncKgFC3?=
 =?us-ascii?Q?2Zso1BfA1nXC46WtPYJo2uUfvJXjMoWvVMRaoB8TqAf9ikMaxMivIVnZCLu0?=
 =?us-ascii?Q?qI8Ny2Yt4so9oMxjh68mSHU7KhQSXzf5z+TPEesQAhiB53ChHA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e94e43-b898-4112-29b4-08de6cf6ff92
X-MS-Exchange-CrossTenant-AuthSource: MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 01:02:04.0439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI2P293MB0038

Check whether the battery supports the relevant charge threshold before
reading the value to silence these errors:

thinkpad_acpi: acpi_evalf(BCTG, dd, ...) failed: AE_NOT_FOUND
ACPI: \_SB_.PCI0.LPC_.EC__.HKEY: BCTG: evaluate failed
thinkpad_acpi: acpi_evalf(BCSG, dd, ...) failed: AE_NOT_FOUND
ACPI: \_SB_.PCI0.LPC_.EC__.HKEY: BCSG: evaluate failed

when reading the charge thresholds via sysfs on platforms that do not
support them such as the ThinkPad T400.

Fixes: 2801b9683f74 ("thinkpad_acpi: Add support for battery thresholds")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=202619
Signed-off-by: Jonathan Teh <jonathan.teh@outlook.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 6b0e4b4c485e..86e7194ac006 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -9526,14 +9526,16 @@ static int tpacpi_battery_get(int what, int battery, int *ret)
 {
 	switch (what) {
 	case THRESHOLD_START:
-		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, ret, battery))
+		if (!battery_info.batteries[battery].start_support ||
+		    ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, ret, battery)))
 			return -ENODEV;
 
 		/* The value is in the low 8 bits of the response */
 		*ret = *ret & 0xFF;
 		return 0;
 	case THRESHOLD_STOP:
-		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, ret, battery))
+		if (!battery_info.batteries[battery].stop_support ||
+		    ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, ret, battery)))
 			return -ENODEV;
 		/* Value is in lower 8 bits */
 		*ret = *ret & 0xFF;
-- 
2.53.0

