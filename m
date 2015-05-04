From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Mon,  4 May 2015 03:17:54 +0100
Message-ID: <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, pure.logic@nexus-software.ie, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org

Quark X1000 ships with 512 KiB of embedded SRAM (eSRAM) a low-latency
memory with access times similar to an L1 cache. eSRAM is used during the
initial bootstrap phases of EFI firmware, this driver provides a gen_pool
interface to eSRAM to allow drivers to make use of eSRAM for fast-access
buffers.

eSRAM can be configured in two flavours - block mode or in per-page overlay
mode. Per-page overlay mode is more interesting in that it allows overlay
of any valid RAM address by eSRAM with a granularity of 4 KiB. This driver
overlays a kzalloc() provided contiguous memory region in 4 KiB increments.

On a read-access to an overlayed region of DRAM data will be fetched from
eSRAM as opposed to DRAM - thus mitigating CAS/RAS latencies associated
with DRAM and allowing DRAM to continue in a lower-power state rather than
service the data access directly.

On a cache miss the cacheline fetch will be roughly 20% faster than
fetching from DRAM on average. Once the cacheline has been populated the
processor operates from the L1 cache so no further performance boost will
be observed.

A follow-on patch provides an eSRAM performance test that illustrates the
performance boost for varying sizes of read operation.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
---
 arch/x86/include/asm/esram.h           |  66 +++++
 arch/x86/platform/intel-quark/Makefile |   1 +
 arch/x86/platform/intel-quark/esram.c  | 502 +++++++++++++++++++++++++++++++++
 drivers/platform/x86/Kconfig           |  17 +-
 4 files changed, 585 insertions(+), 1 deletion(-)
 create mode 100644 arch/x86/include/asm/esram.h
 create mode 100644 arch/x86/platform/intel-quark/esram.c

diff --git a/arch/x86/include/asm/esram.h b/arch/x86/include/asm/esram.h
new file mode 100644
index 0000000..9932862
--- /dev/null
+++ b/arch/x86/include/asm/esram.h
@@ -0,0 +1,66 @@
+/*
+ * esram.h: Embedded SRAM (eSRAM)
+ *
+ * Copyright(c) 2013 Intel Corporation.
+ * Copyright(c) 2015 Bryan O'Donoghue <pure.logic@nexus-software.ie>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; version 2
+ * of the License.
+ *
+ * See 329676_QuarkDatasheet.pdf for register bitmap details.
+ */
+
+#ifndef __ESRAM_H__
+#define __ESRAM_H__
+
+#include <linux/genalloc.h>
+
+/* eSRAM registers */
+#define ESRAMCTRL_REG			0x81
+#define ESRAMPGBLOCK_REG		0x82
+#define ESRAMCERR_REG			0x83
+#define ESRAMUCERR_REG			0x84
+#define ESRAMSDROM_REG			0x88
+
+/* eSRAM Control - Offset 0x81 - Section 12.7.4.37 */
+#define ESRAMCTRL_SIZE(x)		(PAGE_SIZE * (((x >> 16) & 0x7F) + 1))
+#define ESRAMCTRL_ECCTHRESH(x)		((x >> 8) & 0xFF)
+#define ESRAMCTRL_THRESHMSG_EN		BIT(7)
+#define ESRAMCTRL_AVAILABLE		BIT(4)
+#define ESRAMCTRL_ENABLE_ALL		BIT(3)
+#define ESRAMCTRL_GLOBAL_CSR_LOCK	BIT(2)
+#define ESRAMCTRL_SECDEC_EN		BIT(0)
+
+/* eSRAM Page Block Control - Offset 0x82 - Section 12.7.4.38 */
+#define ESRAMPGBLOCK_FLUSH_EN		BIT(31)
+#define ESRAMPGBLOCK_DIS		BIT(29)
+#define ESRAMPGBLOCK_EN			BIT(28)
+#define ESRAMPGBLOCK_CSR_LOCK		BIT(27)
+#define ESRAMPGBLOCK_INIT		BIT(26)
+#define ESRAMPGBLOCK_BUSY		BIT(24)
+#define ESRAMPGBLOCK_BASE(x)		((x & 0xFF) << 24)
+
+/* eSRAM Correctable Error - Offset 0x83 - Section 12.7.4.39 */
+#define ESRAMCERR_ERR_CNT_RST		BIT(25)
+#define ESRAMCERR_ERR_CNT(x)		((x >> 17) & 0xFF)
+#define ESRAMCERR_ERR_PG_DW_OFFSET(x)	((x >> 9) & 0x7F)
+#define ESRAMCERR_ERR_PG_NUM(x)		(x & 0xFF)
+
+/* eSRAM Uncorrectable Error - Offset 0x84 - Section 12.7.4.40 */
+#define ESRAMUCERR_ERR_CNT(x)		((x >> 17) & 0xFF)
+#define ESRAMUCERR_ERR_PG_DW_OFFSET(x)	((x >> 9) & 0x7F)
+#define ESRAMUCERR_ERR_PG_NUM(x)	(x & 0xFF)
+
+/* eSRAM Page Control - Offsets 0-127 - Section 12.7.5.1 */
+#define ESRAMPGCTRL_FLUSH_PAGE_EN	BIT(31)
+#define ESRAMPGCTRL_EN			BIT(28)
+#define ESRAMPGCTRL_LOCK		BIT(27)
+#define ESRAMPGCTRL_INIT_IN_PROG	BIT(26)
+#define ESRAMPGCTRL_BUSY		BIT(24)
+
+struct gen_pool *esram_get_genpool(void);
+
+#endif /* __ESRAM_H__ */
+
diff --git a/arch/x86/platform/intel-quark/Makefile b/arch/x86/platform/intel-quark/Makefile
index 9cc57ed..94adb0b 100644
--- a/arch/x86/platform/intel-quark/Makefile
+++ b/arch/x86/platform/intel-quark/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_INTEL_IMR) += imr.o
+obj-$(CONFIG_INTEL_ESRAM) += esram.o
 obj-$(CONFIG_DEBUG_IMR_SELFTEST) += imr_selftest.o
diff --git a/arch/x86/platform/intel-quark/esram.c b/arch/x86/platform/intel-quark/esram.c
new file mode 100644
index 0000000..51390c3
--- /dev/null
+++ b/arch/x86/platform/intel-quark/esram.c
@@ -0,0 +1,502 @@
+/*
+ * Copyright(c) 2013 Intel Corporation.
+ * Copyright(c) 2015 Bryan O'Donoghue <pure.logic@nexus-software.ie>
+ *
+ * Embedded SRAM (eSRAM) is an on-die low-latency SRAM that can operate in
+ * 512 KiB block mode or in 4 KiB page over-lay mode. eSRAM provides a
+ * low-latency memory with similar access times to an L1 cache.
+ *
+ * eSRAM supports one-time-programming of an overlayed 4 KiB aligned and 4
+ * KiB sized memory region.
+ *
+ * To populate eSRAM we must copy data to a temporary buffer, overlay and
+ * then copy data back to the eSRAM region.
+ *
+ * When entering S3 - we must save eSRAM state to DRAM, the RMU takes
+ * responsibility for this.
+ * When transitioning back to S0 Linux needs restore eSRAM overlay contents
+ * back to the original state - the RMU will not handle this.
+ *
+ * See quark-x1000-datasheet.pdf for register definitions.
+ * http://www.intel.com/content/dam/www/public/us/en/documents/datasheets/quark-x1000-datasheet.pdf
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <asm/cpu_device_id.h>
+#include <asm/desc.h>
+#include <asm/esram.h>
+#include <asm/io.h>
+#include <asm/iosf_mbi.h>
+#include <asm/pgtable.h>
+#include <asm/special_insns.h>
+#include <linux/debugfs.h>
+#include <linux/err.h>
+#include <linux/fs.h>
+#include <linux/genalloc.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/syscore_ops.h>
+#include <linux/timer.h>
+
+#define esram_to_phys(x)	((x) << PAGE_SHIFT)
+#define phys_to_esram(x)	((x) >> PAGE_SHIFT)
+
+/**
+ * struct esram_page
+ *
+ * Represents an eSRAM page.
+ */
+struct esram_page {
+	u32 id;
+	struct list_head list;
+	phys_addr_t addr;
+};
+
+/**
+ * struct esram_dev
+ *
+ * Structre to represent module state/data/etc.
+ */
+struct esram_dev {
+	struct dentry		*dbg;
+	void			*overlay;
+	struct esram_page	*pages;
+	struct gen_pool		*pool;
+	u8			cbuf[PAGE_SIZE];
+	bool			init;
+	struct mutex		lock;
+	u32			num_bytes;
+	struct list_head	page_list;
+	u32			total_pages;
+};
+
+static struct esram_dev esram_dev;
+
+/**
+ * esram_dbgfs_state_show - print state of eSRAM registers.
+ *
+ * @s:		pointer to seq_file for output.
+ * @unused:	unused parameter.
+ * @return:	0 on success or error code passed from mbi_iosf on failure.
+ */
+static int esram_dbgfs_state_show(struct seq_file *s, void *unused)
+{
+	struct esram_dev *edev = &esram_dev;
+	u32 data;
+	u32 reg = (u32)s->private;
+	int ret;
+
+	mutex_lock(&edev->lock);
+	ret = iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, reg, &data);
+	if (ret == 0)
+		seq_printf(s, "0x%08x\n", data);
+	mutex_unlock(&edev->lock);
+	return ret;
+}
+
+/**
+ * esram_state_open - debugfs open callback.
+ *
+ * @inode:	pointer to struct inode.
+ * @file:	pointer to struct file.
+ * @return:	result of single open.
+ */
+static int esram_state_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, esram_dbgfs_state_show, inode->i_private);
+}
+
+static const struct file_operations esram_dbg_ops = {
+	.open		= esram_state_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+/**
+ * esram_debugfs_register - register debugfs hooks.
+ *
+ * @edev:	pointer to esram_device structure.
+ * @return:	0 on success - errno on failure.
+ */
+static int esram_debugfs_register(struct esram_dev *edev)
+{
+	struct dentry *dret;
+
+	edev->dbg = debugfs_create_dir("esram", NULL);
+	if (IS_ERR_OR_NULL(edev->dbg))
+		goto err;
+
+	dret = debugfs_create_file("ctrl", S_IRUGO, edev->dbg,
+				   (void *)ESRAMCTRL_REG, &esram_dbg_ops);
+	if (IS_ERR_OR_NULL(dret))
+		goto err;
+
+	dret = debugfs_create_file("pgblock", S_IRUGO, edev->dbg,
+				   (void *)ESRAMPGBLOCK_REG, &esram_dbg_ops);
+	if (IS_ERR_OR_NULL(dret))
+		goto err;
+
+	dret = debugfs_create_file("cerr", S_IRUGO, edev->dbg,
+				   (void *)ESRAMCERR_REG, &esram_dbg_ops);
+	if (IS_ERR_OR_NULL(dret))
+		goto err;
+
+	dret = debugfs_create_file("ucerr", S_IRUGO, edev->dbg,
+				   (void *)ESRAMUCERR_REG, &esram_dbg_ops);
+	if (IS_ERR_OR_NULL(dret))
+		goto err;
+
+	dret = debugfs_create_file("sdrome", S_IRUGO, edev->dbg,
+				   (void *)ESRAMSDROM_REG, &esram_dbg_ops);
+	if (IS_ERR_OR_NULL(dret))
+		goto err;
+
+	return 0;
+err:
+	if (!IS_ERR_OR_NULL(edev->dbg))
+		debugfs_remove_recursive(edev->dbg);
+	return -1;
+}
+
+/**
+ * esram_debugfs_unregister - unregister debugfs hooks.
+ *
+ * @edev:	pointer to esram_device structure.
+ * @return:
+ */
+static void esram_debugfs_unregister(struct esram_dev *edev)
+{
+	if (!IS_ERR_OR_NULL(edev->dbg))
+		debugfs_remove_recursive(edev->dbg);
+}
+
+/**
+ * esram_page_busy - Determine if an eSRAM page is busy.
+ *
+ * @param ep:	Pointer to the page descriptor.
+ * @return:		int indicating whether or not a page is enabled.
+ */
+static inline int esram_page_busy(struct esram_page *ep)
+{
+	u32 reg = 0;
+	int ret;
+
+	ret = iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MMESRAM_READ, ep->id, &reg);
+	if (ret)
+		return ret;
+	return (reg & ESRAMPGCTRL_BUSY);
+}
+
+/**
+ * esram_dump_fault - dump eSRAM registers and BUG().
+ *
+ * @return:
+ */
+static void esram_dump_fault(struct esram_page *ep)
+{
+	u32 pgc;
+	u32 pgd;
+	u32 pgb;
+
+	/* Show the page state. */
+	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MMESRAM_READ, ep->id, &pgd);
+	pr_err("fault @ page %d state 0x%08x\n", ep->id, pgd);
+
+	/* Get state. */
+	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMCTRL_REG, &pgc);
+	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMPGBLOCK_REG, &pgb);
+	pr_err("page-control=0x%08x, page-block=0x%08x\n", pgc, pgb);
+
+	BUG();
+}
+
+/**
+ * esram_page_enable - Enable an eSRAM page spinning for page to become ready.
+ *
+ * @param ep: struct esram_page carries data to program to register.
+ * @return	zero on success < 0 on error.
+ */
+static int esram_page_enable(struct esram_page *ep)
+{
+	int ret = 0;
+
+	/* Enable a busy page => EINVAL, return IOSF error as necessary. */
+	ret = esram_page_busy(ep);
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	/* Enable page overlay - with automatic flush on S3 entry. */
+	ret = iosf_mbi_write(QRK_MBI_UNIT_MM, QRK_MBI_MMESRAM_WRITE, ep->id,
+			     ESRAMPGCTRL_FLUSH_PAGE_EN | ESRAMPGCTRL_EN |
+			     phys_to_esram(ep->addr));
+	if (ret)
+		return ret;
+
+	/* Busy bit true is good, ret < 0 means IOSF read error. */
+	ret = esram_page_busy(ep);
+	if (ret)
+		ret = 0;
+
+	return ret;
+}
+
+/**
+ * esram_page_overlay - Overlay a page with fast access eSRAM.
+ *
+ * This function takes a 4 KiB aligned physical address and programs an
+ * eSRAM page to overlay that 4 KiB region. We require and verify that the
+ * target memory is read-write - since we don't support overlay of read-only
+ * memory regions - such as kernel .text areas. Overlay of .text areas is
+ * not supported because eSRAM isn't self-populating and we cannot guarantee
+ * atomicity of the overlay operation. It is assumed and required that the
+ * caller of the overlay function is overlaying a data buffer not kernel
+ * code.
+ *
+ * @param ep:	Pointer to eSRAM page desciptor.
+ * @return:		0 on success < 0 on failure.
+ */
+static int esram_page_overlay(struct esram_dev *edev, struct esram_page *ep)
+{
+	int level = 0;
+	void *vaddr = __va(ep->addr);
+	pte_t *pte = lookup_address((unsigned long)vaddr, &level);
+	int ret;
+
+	/* We only support overlay for r/w memory. */
+	if (pte == NULL || !(pte_write(*pte))) {
+		pr_err("invalid address for overlay %pa\n", &ep->addr);
+		return -ENOMEM;
+	}
+
+	/* eSRAM does not autopopulate so save the contents. */
+	memcpy(&edev->cbuf, vaddr, PAGE_SIZE);
+	ret = esram_page_enable(ep);
+	if (ret) {
+		esram_dump_fault(ep);
+		goto err;
+	}
+
+	/* Overlay complete, repopulate the eSRAM page with original data. */
+	memcpy((void *)vaddr, &esram_dev.cbuf,  PAGE_SIZE);
+err:
+	return ret;
+}
+
+/**
+ * esram_map_page - Overlay a vritual address range aligned to 4 KiB.
+ *
+ * @param page:		Page to map.
+ * @return:		0 success < 0 failure.
+ */
+static int esram_map_page(struct esram_dev *edev, struct esram_page *ep)
+{
+	int ret = 0;
+
+	mutex_lock(&edev->lock);
+	ret = esram_page_overlay(edev, ep);
+	if (ret)
+		goto err;
+	list_add(&ep->list, &edev->page_list);
+err:
+	mutex_unlock(&edev->lock);
+	return ret;
+}
+
+/**
+ * esram_resume - restore eSRAM overlays on S3=>S0 transition.
+ *
+ * @return:
+ */
+static void esram_resume(void)
+{
+	struct esram_dev *edev = &esram_dev;
+	struct esram_page *ep = NULL;
+
+	mutex_lock(&edev->lock);
+	list_for_each_entry(ep, &edev->page_list, list)
+		if (esram_page_overlay(edev, ep))
+			pr_err("restore page %d phys %pa fail!\n",
+				ep->id, &ep->addr);
+	mutex_unlock(&edev->lock);
+}
+
+/* Shutdown is done by RMU. Kernel needs to-do the resume() though. */
+static struct syscore_ops esram_syscore_ops = {
+	.resume		= esram_resume,
+};
+
+/**
+ * esram_get_genpool - return pointer to esram genpool structure.
+ *
+ * @return:
+ */
+struct gen_pool *esram_get_genpool(void)
+{
+	struct esram_dev *edev = &esram_dev;
+
+	return edev->init ? edev->pool : NULL;
+}
+EXPORT_SYMBOL_GPL(esram_get_genpool);
+
+static const struct x86_cpu_id esram_ids[] __initconst = {
+	{ X86_VENDOR_INTEL, 5, 9 },	/* Intel Quark SoC X1000. */
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, esram_ids);
+
+ /**
+ * esram_init - entry point for eSRAM driver.
+ *
+ * This driver manages eSRAM on a per-page basis. Therefore if we find block
+ * mode is enabled, or any global, block-level or page-level locks are in place
+ * at module initialisation time - we bail out.
+ *
+ * return: -ENODEV for no eSRAM support 0 if good to go.
+ */
+static int __init esram_init(void)
+{
+	u32 block;
+	u32 ctrl;
+	struct esram_page *ep = NULL;
+	struct esram_dev *edev = &esram_dev;
+	phys_addr_t addr;
+	int i;
+	int ret;
+
+	if (!x86_match_cpu(esram_ids) || !iosf_mbi_available())
+		return -ENODEV;
+
+	memset(edev, 0x00, sizeof(esram_dev));
+	INIT_LIST_HEAD(&edev->page_list);
+	mutex_init(&edev->lock);
+
+	/* Ensure block mode disabled. */
+	block = ESRAMPGBLOCK_DIS;
+	ret = iosf_mbi_write(QRK_MBI_UNIT_MM, QRK_MBI_MM_WRITE, ESRAMPGBLOCK_REG, block);
+	if (ret)
+		return ret;
+
+	/* Get global control and block status. */
+	ret = iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMCTRL_REG, &ctrl);
+	if (ret)
+		return ret;
+	ret = iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMPGBLOCK_REG, &block);
+	if (ret)
+		return ret;
+
+	/* Ensure no global lock exists. */
+	if (ctrl & ESRAMCTRL_GLOBAL_CSR_LOCK)
+		return -ENODEV;
+
+	if (block & (ESRAMPGBLOCK_CSR_LOCK | ESRAMPGBLOCK_EN))
+		return -ENODEV;
+
+	/* Calculate # of pages silicon supports. */
+	edev->num_bytes = ESRAMCTRL_SIZE(ctrl);
+	edev->total_pages = edev->num_bytes / PAGE_SIZE;
+	if (edev->total_pages == 0)
+		return -ENOMEM;
+
+	/* Get an array of esram pages. */
+	edev->pages = kzalloc(edev->total_pages *
+		sizeof(struct esram_page), GFP_KERNEL);
+	if (IS_ERR(edev->pages)) {
+		ret = PTR_ERR(edev->pages);
+		goto err;
+	}
+
+	/* Make an area for the gen_pool to operate from. */
+	edev->overlay = kmalloc(edev->num_bytes, GFP_KERNEL);
+	if (IS_ERR(edev->overlay)) {
+		ret = PTR_ERR(edev->overlay);
+		goto err;
+	}
+	edev->pool = gen_pool_create(ilog2(PAGE_SIZE), -1);
+	if (!edev->pool) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	ret = gen_pool_add_virt(edev->pool, (unsigned long)edev->overlay,
+				__pa(edev->overlay), edev->num_bytes, -1);
+	if (ret)
+		goto err;
+
+	/* Overlay contiguous region with eSRAM pages. */
+	addr = __pa(edev->overlay);
+	for (i = 0; i < edev->total_pages; i++) {
+		ep = &edev->pages[i];
+		ep->id = i;
+		ep->addr = addr;
+
+		/* Validate page state is not busy. */
+		ret = esram_page_busy(ep);
+		if (ret) {
+			esram_dump_fault(ep);
+			ret = ret < 0 ? ret : -ENOMEM;
+			goto err;
+		}
+
+		/* Overlay. */
+		ret = esram_map_page(edev, ep);
+		if (ret)
+			goto err;
+		addr += PAGE_SIZE;
+	}
+
+	register_syscore_ops(&esram_syscore_ops);
+	ret = esram_debugfs_register(edev);
+	if (ret != 0)
+		pr_warn("debugfs register failed!\n");
+	edev->init = true;
+
+	pr_info("overlay mode with %d pages - OK\n", edev->total_pages);
+	return 0;
+err:
+	if (edev->pool != NULL)
+		gen_pool_destroy(edev->pool);
+
+	if (!IS_ERR(edev->pages))
+		kfree(edev->pages);
+
+	return ret;
+}
+
+/**
+ * esram_exit - exit point for eSRAM code.
+ *
+ * Deregisters debugfs, leave eSRAM state as-is.
+ *
+ * return:
+ */
+static void __exit esram_exit(void)
+{
+	struct esram_dev *edev = &esram_dev;
+
+	if (edev->pool != NULL) {
+		if (gen_pool_avail(edev->pool) < gen_pool_size(edev->pool))
+			pr_err("removing in-use eSRAM gen_pool!\n");
+		gen_pool_destroy(edev->pool);
+	}
+
+	if (!IS_ERR(edev->pages))
+		kfree(edev->pages);
+
+	esram_debugfs_unregister(&esram_dev);
+	unregister_syscore_ops(&esram_syscore_ops);
+}
+
+module_init(esram_init);
+module_exit(esram_exit);
+
+MODULE_AUTHOR("Bryan O'Donoghue <pure.logic@nexus-software.ie>");
+MODULE_DESCRIPTION("Intel Embedded SRAM overlay driver");
+MODULE_LICENSE("Dual BSD/GPL");
+
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f9f205c..42b7b88 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -737,7 +737,7 @@ config INTEL_IPS
 	  supported platforms.
 
 config INTEL_IMR
-	bool "Intel Isolated Memory Region support"
+	tristate "Intel Isolated Memory Region support"
 	default n
 	depends on X86_INTEL_QUARK && IOSF_MBI
 	---help---
@@ -761,6 +761,21 @@ config INTEL_IMR
 
 	  If you are running on a Galileo/Quark say Y here.
 
+config INTEL_ESRAM
+	bool "Intel Embedded SRAM (eSRAM) support"
+	default n
+	depends on X86_INTEL_QUARK && IOSF_MBI
+	select GENERIC_ALLOCATOR
+	---help---
+	  This options provides an API to allocate memory from Embedded SRAM
+	  (eSRAM) present on Quark X1000 SoC processors.
+	  eSRAM is a 512 KiB block of low-latency SRAM organized as
+	  128 * 4 KiB pages or as one 512 KiB chunk of memory. This driver
+	  enables eSRAM in per-page overlay mode and provides a gen_pool
+	  allocator which allows allocation of memory from the eSRAM pool.
+
+	  If you are running on a Galileo/Quark say Y here.
+
 config IBM_RTL
 	tristate "Device driver to enable PRTL support"
 	depends on X86 && PCI
-- 
1.9.1
