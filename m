Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971432825B;
	Thu, 15 Jan 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768463369; cv=fail; b=ofpFIHvx7UVBMCxPHVNtyLCpcfDg0Vl/A7imgLtiaTjhP2CWbpg0QlWdaexT0GBHOe0FHwkX9jTqdXyFBnksxta99MH27Eeu9OedvZhYjExkafvIcz/oIgI3qoJo8I5YQQISSXPWU4CTVejX3XxOuKpOgcf/XS2xWCSyENIf5PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768463369; c=relaxed/simple;
	bh=e59Na8hQwG4Q776dTUowKtGX/4CQlMHgvb3vC14Ktaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/9xmV2sj0Y2yyL/R7WqKbB0IpANfEmwwncgnMHe0pb1KHPLFer9RdKzZFs3FBrU156htfv2S/wrUFFmChZyst4FKmiaKCi9Iga4gVMxXml8Ifjaqxr/QJtOaIWciIgSDRieDnBU+YqU+6lyjCb42oJjUMzOoyAGgkD15FiF944=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p9MLiDUn; arc=fail smtp.client-ip=52.101.85.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p9MLiDUn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9po1J2ZgUH94uMK/JlJVDJfPdYe6CG84BOQspMY/EAOLJ9ybmjWxTVuKIUS9xy5S5ooZEkFPv5BozER8OlSx7OE6CQeLHAlgIp1EbzFZHwPvo3MuB6eqZqBGx6Rv3/aK3WdJW8WbeDmbQm56WDZdfUknBJMfkZVmGSRjRLRVo7WwmJ6JToTzr42kaqa523JOP3ckQAdt4fUFe0zljNOdSVENUnI9nhHGIngYEYEOcbmGJ5hmgzl7m+br6SXL4dbQlkZ4HAk7D4w/VYWWa3cPlLWeKAImG5iqOcPSTRXFcD6PdjFS/5/X/k13LhpxK7Y0XcZqXe4yK3Cu33smZEgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEmDEK3BQBiq+x6mCdP6qh2jPXQ/eajxR7qdTc1Q2/M=;
 b=ejY+tFYpcepS3LxX81QcIzAt4ehZNq1/OYrh6JMPmwdxH9YgyShmzKfotLjklJ7/H5BBnzyIEbs98h3xAuEVC6l/k1l3VftD0I8yriONjrPqolkJzDcEfdvs71hR2u03gvrFcDWVSgwHXh6zYsiVaXqWKNOiJtnRhtXOPgzAlTux6pw8roZX2K2cbLl/lSxmcjxAKzRG2Hq6YKZQNhBu5CD1aupNSEu0PAH2l+80hxMdnLSkJhVwwH3FAA+MSRC8Xr7JlYKjHlnYHWpPENvcRw4x26Fk3B6ARS3VEkpkZ/wmpzElIwUERMJpy3A/flIoAxCBDBC4TM6AkH+SAOg8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEmDEK3BQBiq+x6mCdP6qh2jPXQ/eajxR7qdTc1Q2/M=;
 b=p9MLiDUnPOqoa9MKyp5hmwOLsuZ3+4adksxpdBy4WRIh/paYvbInV3FmhRLwXXE5j5WFdlrjfsj55RFo0cAuxYWnWjDz28wPJpK12g0VGbngyDPTzvalSyzC13p8C7G0jHgDvsZy2/6DCnio9ITGysy7x0xzUEMNNleVzK3KJXP7Qhp3HsBMR9R3KX3hObpiJzyOTTG6Lj7HPFkVnN9f/z6hiF/Yg96tR4qSrxPuMgiTX2m0AB9Mef1/9ftPRISl5yGz1FVSY3+Tn+efm6JESwlALQqTeQMxd7vkRdj4XljoWft35k6zaOqH+RtkroHj1AeCejcuonkUnVuKcSdvoA==
Received: from SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::22)
 by SA1PR12MB999107.namprd12.prod.outlook.com (2603:10b6:806:4a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:49:24 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::3d) by SJ0P220CA0014.outlook.office365.com
 (2603:10b6:a03:41b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Thu,
 15 Jan 2026 07:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:49:24 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 23:49:17 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 14 Jan 2026 23:49:17 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 23:49:15 -0800
From: Ciju Rajan K <crajank@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<tglx@linutronix.de>
CC: <christophe.jaillet@wanadoo.fr>, <andriy.shevchenko@linux.intel.com>,
	<vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Ciju Rajan K <crajank@nvidia.com>
Subject: [PATCH platform-next v4 1/2] kernel/irq: Add generic interrupt storm detection mechanism
Date: Thu, 15 Jan 2026 09:49:08 +0200
Message-ID: <20260115074909.245852-2-crajank@nvidia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115074909.245852-1-crajank@nvidia.com>
References: <20260115074909.245852-1-crajank@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|SA1PR12MB999107:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0e9179-6f7e-4ee4-5bbd-08de540a9a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gpp9fnd8QJFwMms+lTTBWMLymqwGmJUrTbEQ+M2pmEgPlcI4NpGHgAZdHHlm?=
 =?us-ascii?Q?5vdMNrctyvZOD2SiQlWwIaTtd3H1ewPBLABOQyryNp3NXflwqFCoPQqXjwk0?=
 =?us-ascii?Q?A9RWmi/cDCrcN5O8BWYAEXwUKtNkwi2xHUPggx09hGxVBM7XupgblshuFymt?=
 =?us-ascii?Q?mKMr3mS1Of1gUwlFzr+TlEmHRiCCC+Nq31EiazCjWEVPvVUKd5awaob2wyKy?=
 =?us-ascii?Q?K3jUme2+Pg8YHUXL70qWSxkBVw0xPCpgfiHJ2aDWLJviz690Uh7+CZCkg2w7?=
 =?us-ascii?Q?Uox3ma3jwnooL7ylSE0W5FQJqLPa/pfs8LcF7QvAGxlyRrwkH1yEfkIua1sQ?=
 =?us-ascii?Q?lI2Sq2SO0Rz/9FmD0TF4XALNqf/sYSK6r6ATBtoW0SDKu15RvWT6bcZeMYQB?=
 =?us-ascii?Q?5A4b0vdIuKVUzvmYT2A5sUfnq/bQ+TkprU7Jmj3DFglCjoUW0WGXagLlALhT?=
 =?us-ascii?Q?yV4a9MCEx1tqhfRkDylLYqa8resaMsBU/Vj92SNckiknFJkwtynb9hFrhp+d?=
 =?us-ascii?Q?EyTMsM/A3kBX0bq/7KFchaJNXHZ9dpPimMCki5etvvrLu0XA2gLFditQyHuL?=
 =?us-ascii?Q?t9d2i5ImcuYOfJwJ0WZ42SrWEJejd7n+phkYGGZJn497RSH6h44rYAYEjXUu?=
 =?us-ascii?Q?MNDA7cKIEX871mDLon3YItEAgsvv1UnfKwJm08DHYcbR4kcMk0UehM1rHHa+?=
 =?us-ascii?Q?xg2jL2MmrrvRVpiB0jCRu8PGlYJftqHeompF+xHrcalrbv24LOjrMKb/a/Lh?=
 =?us-ascii?Q?+uGqdQuHtfwpQdhst5IdMS0G4PoeCrIu3gRYVK82P71RzkYAOA4nsZ5vGlgS?=
 =?us-ascii?Q?yV2tHyjMWvbfKOb/SE2sY/oLGUjqXw+GqGgjIZ4XhJH5ZMVvcR6FATexJlXa?=
 =?us-ascii?Q?Bxz/AUwMgtom1IlM2pJURuup/3t2pMozdBY+VBQTgAw2wGGEj0ngOExX1m7D?=
 =?us-ascii?Q?GzuGOIkxMBGArv0L1lt/VKezBtOut0zv4hRl2J8k5NHIoBwZReNxaMuL0/7a?=
 =?us-ascii?Q?aIhWL5jGpZL/DbQYEobhX9Vq78LjWrB6x3wFZtS5XPhRVk9dUvtjXBg+0GsS?=
 =?us-ascii?Q?0N2AIkCqbfO4H+kk38wO/GLxjolSwmWhHfdEjCFPqKjSDmy5gYfy5DJfL755?=
 =?us-ascii?Q?WIrjPXpJ1bCzxYDBzso443v1IW6Ui3YKqhyj27Xk73515/2I1vKwdcr3TOD6?=
 =?us-ascii?Q?5hYsReoLhbAlvDnjOUdwAjxUlNSJKxCnpbOfP+01n+qVzgK7up1ueV2z7vd0?=
 =?us-ascii?Q?pT95tEtc/E9DE42JuCFZfOK3w4a/K5PwsH3xi417xiPKLkpcaq/DcTTh2mWS?=
 =?us-ascii?Q?xAPQWZbh9Qc46bh9ObiVHVT03PYV3rrawhcb5qYJUzqVukaYmIBepvOkDPbr?=
 =?us-ascii?Q?9Q9MOWAAbNXPNv5i42tcOY716MebEjDny8wAZQZwR5cDiFlIdJ+13a9dN7Ya?=
 =?us-ascii?Q?jUfBwROwf8Zd+WBI6OJuQNnQVjub82qFwd3xOjG5IBWW0iAVoZkfLhxD57FB?=
 =?us-ascii?Q?aZUxgf2vzZcTFQMpqJpT57JG1LHxqAR0qLcRtmd4ZmZozN1cddCs0Ws+/VmY?=
 =?us-ascii?Q?DXp36EhboOS/mYwiBFbnqeOdstKYCXpZkJc/hLqu1SwmwvFX5OdNpFQqbFH9?=
 =?us-ascii?Q?Uinr+btwK6kPJKuNpZymORL7h6FTPPawC+5yIanIC2tjk0xfWaxJ+hbZq6Ni?=
 =?us-ascii?Q?s5FssA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:49:24.6154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0e9179-6f7e-4ee4-5bbd-08de540a9a2f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999107

If the hardware is broken, it is possible that faulty device will
flood interrupt handler with false events. For example, if fan or
power supply has damaged presence pin, it will cause permanent
generation of plugged in / plugged out events. As a result, interrupt
handler will consume a lot of CPU resources and will keep raising
"UDEV" events to the user space.

This patch provides a mechanism for detecting interrupt storm.
Use the following criteria: if the specific interrupt was generated
'N' times during 'T' seconds, such device is to be considered as
broken and user will be notified through a call back function.
This feature can be used by any kernel subsystems or drivers.

The implementation includes:

- irq_storm_cb_t: Callback function type for storm notifications
- struct irq_storm: Per-IRQ storm detection data structure
- irq_register_storm_detection(): Register storm detection with
				  configurable parameters
- irq_unregister_storm_detection(): Unregister storm detection
- Integration with note_interrupt() for automatic storm checking

Callback API parameters:
- irq: interrupt number to monitor
- max_freq: maximum allowed frequency (interrupts per second)
- dev_id: device identifier passed to callback

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ciju Rajan K <crajank@nvidia.com>
---
 include/linux/interrupt.h | 13 ++++++
 include/linux/irqdesc.h   | 20 +++++++++
 kernel/irq/manage.c       |  4 ++
 kernel/irq/spurious.c     | 87 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 266f2b39213a..9fbda5d08a8f 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -20,6 +20,7 @@
 #include <asm/ptrace.h>
 #include <asm/irq.h>
 #include <asm/sections.h>
+#include <linux/jiffies.h>
 
 /*
  * These correspond to the IORESOURCE_IRQ_* defines in
@@ -139,6 +140,14 @@ struct irqaction {
 	struct proc_dir_entry	*dir;
 } ____cacheline_internodealigned_in_smp;
 
+/**
+ * irq_storm_cb_t - callback function type for interrupt storm detection
+ * @irq: interrupt number that is storming
+ * @freq: detected frequency (interrupts per second)
+ * @dev_id: device identifier passed during registration
+ */
+typedef void (*irq_storm_cb_t)(unsigned int irq, unsigned int freq, void *dev_id);
+
 extern irqreturn_t no_action(int cpl, void *dev_id);
 
 /*
@@ -331,6 +340,10 @@ extern int irq_force_affinity(unsigned int irq, const struct cpumask *cpumask);
 extern int irq_can_set_affinity(unsigned int irq);
 extern int irq_select_affinity(unsigned int irq);
 
+extern bool irq_register_storm_detection(unsigned int irq, unsigned int max_freq,
+					 irq_storm_cb_t cb, void *dev_id);
+extern void irq_unregister_storm_detection(unsigned int irq);
+
 extern int __irq_apply_affinity_hint(unsigned int irq, const struct cpumask *m,
 				     bool setaffinity);
 
diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 17902861de76..d27f02371a6c 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -17,6 +17,9 @@ struct irq_desc;
 struct irq_domain;
 struct pt_regs;
 
+/* Forward declaration - full definition in interrupt.h */
+typedef void (*irq_storm_cb_t)(unsigned int, unsigned int, void *);
+
 /**
  * struct irqstat - interrupt statistics
  * @cnt:	real-time interrupt count
@@ -29,6 +32,22 @@ struct irqstat {
 #endif
 };
 
+/**
+ * struct irq_storm - interrupt storm detection data
+ * @max_cnt:		maximum interrupt count per time window
+ * @last_cnt:		last total interrupt count snapshot
+ * @next_period:	next time period boundary (jiffies)
+ * @cb:			callback function to invoke on storm detection
+ * @dev_id:		device identifier for callback
+ */
+struct irq_storm {
+	unsigned long		max_cnt;
+	unsigned long		last_cnt;
+	unsigned long		next_period;
+	irq_storm_cb_t		cb;
+	void			*dev_id;
+};
+
 /**
  * struct irq_desc - interrupt descriptor
  * @irq_common_data:	per irq and chip data passed down to chip functions
@@ -101,6 +120,7 @@ struct irq_desc {
 #ifdef CONFIG_PROC_FS
 	struct proc_dir_entry	*dir;
 #endif
+	struct irq_storm	*irq_storm;
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	struct dentry		*debugfs_file;
 	const char		*dev_name;
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 349ae7979da0..d413bf11ffde 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1951,6 +1951,10 @@ static struct irqaction *__free_irq(struct irq_desc *desc, void *dev_id)
 		irq_release_resources(desc);
 		chip_bus_sync_unlock(desc);
 		irq_remove_timings(desc);
+		if (desc->irq_storm) {
+			kfree(desc->irq_storm);
+			desc->irq_storm = NULL;
+		}
 	}
 
 	mutex_unlock(&desc->request_mutex);
diff --git a/kernel/irq/spurious.c b/kernel/irq/spurious.c
index 73280ccb74b0..525dc0e384f1 100644
--- a/kernel/irq/spurious.c
+++ b/kernel/irq/spurious.c
@@ -22,6 +22,90 @@ static DEFINE_TIMER(poll_spurious_irq_timer, poll_spurious_irqs);
 int irq_poll_cpu;
 static atomic_t irq_poll_active;
 
+/* Minimum frequency threshold */
+#define IRQ_STORM_MIN_FREQ_HZ		50
+#define IRQ_STORM_MAX_FREQ_SCALE	(IRQ_STORM_MIN_FREQ_HZ * 2)
+/* Time window over which storm check is performed */
+#define IRQ_STORM_PERIOD_WINDOW_MS	(IRQ_STORM_MIN_FREQ_HZ * 20)
+
+
+/**
+ * irq_register_storm_detection - register interrupt storm detection for an IRQ
+ * @irq: interrupt number
+ * @max_freq: maximum allowed frequency (interrupts per second)
+ * @cb: callback function to invoke when storm is detected
+ * @dev_id: device identifier passed to callback
+ *
+ * Returns: true on success, false on failure
+ */
+bool irq_register_storm_detection(unsigned int irq, unsigned int max_freq,
+				  irq_storm_cb_t cb, void *dev_id)
+{
+	struct irq_storm *storm;
+	bool ret = false;
+
+	if (max_freq < IRQ_STORM_MIN_FREQ_HZ || !cb)
+		return false;
+
+	storm = kzalloc(sizeof(*storm), GFP_KERNEL);
+	if (!storm)
+		return false;
+
+	/* Adjust to count per 10ms */
+	storm->max_cnt = max_freq / (IRQ_STORM_MAX_FREQ_SCALE);
+	storm->cb = cb;
+	storm->dev_id = dev_id;
+
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		if (scoped_irqdesc->action && !scoped_irqdesc->irq_storm) {
+			storm->last_cnt = scoped_irqdesc->tot_count;
+			storm->next_period = jiffies + msecs_to_jiffies(IRQ_STORM_PERIOD_WINDOW_MS);
+			scoped_irqdesc->irq_storm = storm;
+			ret = true;
+		}
+	}
+
+	if (!ret)
+		kfree(storm);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(irq_register_storm_detection);
+
+/**
+ * irq_unregister_storm_detection - unregister interrupt storm detection
+ * @irq: interrupt number
+ */
+void irq_unregister_storm_detection(unsigned int irq)
+{
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		if (scoped_irqdesc->irq_storm) {
+			kfree(scoped_irqdesc->irq_storm);
+			scoped_irqdesc->irq_storm = NULL;
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(irq_unregister_storm_detection);
+
+static void irq_storm_check(struct irq_desc *desc)
+{
+	struct irq_storm *storm = desc->irq_storm;
+	unsigned long delta, now = jiffies;
+
+	if (!time_after_eq(now, storm->next_period))
+		return;
+
+	storm->next_period = now + msecs_to_jiffies(IRQ_STORM_PERIOD_WINDOW_MS);
+	delta = desc->tot_count - storm->last_cnt;
+	storm->last_cnt = desc->tot_count;
+	if (delta > storm->max_cnt) {
+		/* Calculate actual frequency: interrupts per second */
+		storm->cb(irq_desc_get_irq(desc),
+			(delta * (IRQ_STORM_MAX_FREQ_SCALE)),
+			storm->dev_id);
+	}
+}
+
 /*
  * Recovery handler for misrouted interrupts.
  */
@@ -231,6 +315,9 @@ void note_interrupt(struct irq_desc *desc, irqreturn_t action_ret)
 		return;
 	}
 
+	if (desc->irq_storm && action_ret == IRQ_HANDLED)
+		irq_storm_check(desc);
+
 	/*
 	 * We cannot call note_interrupt from the threaded handler
 	 * because we need to look at the compound of all handlers
-- 
2.47.3

