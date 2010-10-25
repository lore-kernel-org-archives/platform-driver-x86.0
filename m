From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] intel_scu_ipc_utils: Support for reflashing Medfield firmware
Date: Mon, 25 Oct 2010 15:39:43 +0100
Message-ID: <20101025143939.27262.50685.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:43056 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751267Ab0JYPe1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Oct 2010 11:34:27 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

From: Sudha Krishnakumar <sudha.krishnakumar@intel.com>

Initial flashing support. This will change before any production release.

Signed-off-by: Sudha Krishnakumar <sudha.krishnakumar@intel.com>
[Tidied up the bracketing and some oddments]
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 arch/x86/include/asm/intel_scu_ipc.h     |    3 
 drivers/platform/x86/intel_scu_ipc.c     |  363 ++++++++++++++++++++++++++++++
 drivers/platform/x86/intel_scu_ipcutil.c |   28 +-
 3 files changed, 383 insertions(+), 11 deletions(-)


diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index 29f6679..9f21f27 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -44,4 +44,7 @@ int intel_scu_ipc_i2c_cntrl(u32 addr, u32 *data);
 /* Update FW version */
 int intel_scu_ipc_fw_update(u8 *buffer, u32 length);
 
+/* Upgrade FW version on Medfield */
+int intel_scu_ipc_medfw_upgrade(void __user *arg);
+
 #endif
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 37128c6..4e28221 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -3,6 +3,8 @@
  *
  * (C) Copyright 2008-2010 Intel Corporation
  * Author: Sreedhara DS (sreedhara.ds@intel.com)
+ * (C) Copyright 2010 Intel Corporation
+ * Author: Sudha Krishnakumar (sudha.krishnakumar@intel.com)
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -511,6 +513,7 @@ EXPORT_SYMBOL(intel_scu_ipc_i2c_cntrl);
 #define IPC_CMD_FW_UPDATE_READY  0x10FE
 /* IPC inform SCU to go for update process */
 #define IPC_CMD_FW_UPDATE_GO     0x20FE
+#define IPC_CMD_FW_UPDATE_GO_MHUPD     0x2030FE
 /* Status code for fw update */
 #define IPC_FW_UPDATE_SUCCESS	0x444f4e45 /* Status code 'DONE' */
 #define IPC_FW_UPDATE_BADN	0x4241444E /* Status code 'BADN' */
@@ -539,6 +542,9 @@ int intel_scu_ipc_fw_update(u8 *buffer, u32 length)
 	int retry_cnt = 0;
 	u32 status;
 
+	if (platform != MRST_CPU_CHIP_LINCROFT)
+		return -EINVAL;
+
 	mutex_lock(&ipclock);
 	fw_update_base = ioremap_nocache(IPC_FW_LOAD_ADDR, (128*1024));
 	if (fw_update_base == NULL) {
@@ -645,6 +651,363 @@ update_end:
 }
 EXPORT_SYMBOL(intel_scu_ipc_fw_update);
 
+/* Medfield firmware update.
+ * The flow and communication between IA and SCU has changed for
+ * Medfield firmware update. For more details, please refer to
+ * Firmware Arch Spec.
+ * Below macros and structs apply for medfield firmware update
+ */
+
+#define MAX_FW_CHUNK (128*1024)
+#define SRAM_ADDR 0xFFFC0000
+#define MAILBOX_ADDR   0xFFFE0000
+
+#define SCU_FLAG_OFFSET 8
+#define IA_FLAG_OFFSET 12
+#define MIP_HEADER_LEN 2048 /* For A0, will change for B0,also bug in FUPH
+			     * header we should just be able to read it off
+			     * correct value from FUPH..ideally.
+			     */
+#define MIP_HEADER_OFFSET 0
+#define LOWER_128K_OFFSET (MIP_HEADER_OFFSET+MIP_HEADER_LEN)
+#define UPPER_128K_OFFSET (LOWER_128K_OFFSET+MAX_FW_CHUNK)
+
+#define DNX_HDR_LEN  24
+#define FUPH_HDR_LEN 28
+
+#define DNX_IMAGE        "DXBL"
+#define FUPH_HDR_SIZE    "RUPHS"
+#define FUPH		 "RUPH"
+#define MIP              "DMIP"
+#define LOWER_128K       "LOFW"
+#define UPPER_128K       "HIFW"
+#define UPDATE_DONE      "DONE"
+
+/* Modified IA-SCU mailbox for medfield firmware update. */
+struct ia_scu_mailbox {
+	char mail[8];
+	u32 scu_flag;
+	u32 ia_flag;
+};
+
+/* Structure to parse input from firmware-update application. */
+struct fw_ud {
+	u8 *fw_file_data;
+	u32 fsize;
+	u8 *dnx_hdr;
+	u8 *dnx_file_data;
+	u32 dnx_size;
+};
+
+struct mfld_fw_update {
+	void __iomem *sram;
+	void __iomem *mailbox;
+	u32 wscu;
+	u32 wia;
+	char mb_status[8];
+};
+
+/*
+ * IA will wait in busy-state, and poll mailbox, to check
+ * if SCU is done processing.
+ * If it has to wait for more than a second, it will exit with
+ * error code.
+ */
+
+static int busy_wait(struct mfld_fw_update *mfld_fw_upd)
+{
+	u32 count = 0;
+	u32 flag;
+
+	flag = mfld_fw_upd->wscu;
+
+	while (ioread32(mfld_fw_upd->mailbox + SCU_FLAG_OFFSET) != flag
+		&& count < 120) {
+		/* There are synchronization issues between IA and SCU */
+		mb();
+		/* FIXME: we must use mdelay currently */
+		mdelay(10);
+		count++;
+	}
+
+	if (ioread32(mfld_fw_upd->mailbox + SCU_FLAG_OFFSET) != flag) {
+		dev_err(&ipcdev.pdev->dev, "IA-wait >2 secs,quitting\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+/* This function will
+ * 1)copy firmware chunk from user-space to kernel-space.
+ * 2) Copy from kernel-space to shared SRAM.
+ * 3) Write to mailbox.
+ * 4) And wait for SCU to process that firmware chunk.
+ * Returns 0 on success, and < 0 for failure.
+ */
+static int process_fw_chunk(u8 *fws, u8 __user *userptr, u32 chunklen,
+					struct mfld_fw_update *mfld_fw_upd)
+{
+	if (copy_from_user(fws, userptr, chunklen))
+		return -EFAULT;
+
+	/* IA copy to sram */
+	memcpy_toio(mfld_fw_upd->sram, fws, chunklen);
+
+	/* There are synchronization issues between IA and SCU */
+	mb();
+	mfld_fw_upd->wia = !(mfld_fw_upd->wia);
+	iowrite32(mfld_fw_upd->wia, mfld_fw_upd->mailbox + IA_FLAG_OFFSET);
+
+	mb();
+	dev_dbg(&ipcdev.pdev->dev, "wrote ia_flag=%d\n",
+		 ioread32(mfld_fw_upd->mailbox + IA_FLAG_OFFSET));
+
+	mfld_fw_upd->wscu = !mfld_fw_upd->wscu;
+	return busy_wait(mfld_fw_upd);
+}
+
+/*
+ * This function will check if mailbox status flag, indicates any errors.
+ */
+static int check_mb_status(char *mb_status, struct mfld_fw_update *mfld_fw_upd)
+{
+
+	/* There are synchronization issues between IA and SCU */
+	smp_mb();
+
+	memcpy_fromio(mfld_fw_upd->mb_status, mfld_fw_upd->mailbox, 8);
+
+	if ((strncmp(mfld_fw_upd->mb_status, "ER", 2) == 0) ||
+		(strncmp(mfld_fw_upd->mb_status, "HLT0", 4) == 0)) {
+		dev_dbg(&ipcdev.pdev->dev,
+			"mailbox error=%s\n", mfld_fw_upd->mb_status);
+		return -EINVAL;
+	} else {
+		if (strncmp(mfld_fw_upd->mb_status, mb_status,
+				strlen(mfld_fw_upd->mb_status)) != 0) {
+			dev_dbg(&ipcdev.pdev->dev,
+				"unexpected state=%s", mfld_fw_upd->mb_status);
+			return -EINVAL;
+		} else {
+			dev_dbg(&ipcdev.pdev->dev,
+				"mailbox pass=%s\n", mfld_fw_upd->mb_status);
+		}
+	}
+
+	return 0;
+}
+
+
+/**
+ *	intel_scu_ipc_medfw_upgrade	- Medfield Firmware update utility
+ *	@arg: firmware buffer in user-space.
+ *
+ * The flow and communication between IA and SCU has changed for
+ * Medfield firmware update. So we have a different api below
+ * to support Medfield firmware update.
+ *
+ * On success returns 0, for failure , returns < 0.
+ */
+int intel_scu_ipc_medfw_upgrade(void __user *arg)
+{
+	struct fw_ud fw_ud_param;
+	struct mfld_fw_update	mfld_fw_upd;
+	u8 *fw_file_data = NULL;
+	u8 *fws = NULL;
+	u8 *fuph_ptr = NULL;
+	int ret_val = 0;
+
+	if (platform != MRST_CPU_CHIP_PENWELL)
+		return -EINVAL;
+
+	mutex_lock(&ipclock);
+	if (ipcdev.pdev == NULL) {
+		ret_val = -ENODEV;
+		goto out_unlock;
+	}
+
+	mfld_fw_upd.wscu = 0;
+	mfld_fw_upd.wia = 0;
+	memset(mfld_fw_upd.mb_status, 0, sizeof(char) * 8);
+
+	if (copy_from_user(&fw_ud_param, arg, sizeof(fw_ud_param)))
+		return -EFAULT;
+
+	fw_file_data = fw_ud_param.fw_file_data;
+	if (fw_file_data == NULL || fw_ud_param.fsize == 0 ||
+	    fw_ud_param.dnx_size == 0 || fw_ud_param.dnx_hdr == NULL ||
+	    fw_ud_param.dnx_file_data == NULL) {
+		dev_err(&ipcdev.pdev->dev,
+			"ipc_medfw_upgrade, invalid args!!\n");
+		ret_val = -EINVAL;
+		goto out_unlock;
+	}
+
+	mfld_fw_upd.sram = ioremap_nocache(SRAM_ADDR, MAX_FW_CHUNK);
+	if (mfld_fw_upd.sram == NULL) {
+		dev_err(&ipcdev.pdev->dev, "unable to map sram\n");
+		ret_val = -ENOMEM;
+		goto out_unlock;
+	}
+
+	mfld_fw_upd.mailbox = ioremap_nocache(MAILBOX_ADDR,
+					sizeof(struct ia_scu_mailbox));
+
+	if (mfld_fw_upd.mailbox == NULL) {
+		dev_err(&ipcdev.pdev->dev, "unable to map the mailbox\n");
+		ret_val = -ENOMEM;
+		goto unmap_sram;
+	}
+
+	/*IA initializes both IAFlag and SCUFlag to zero */
+	iowrite32(0, mfld_fw_upd.mailbox + SCU_FLAG_OFFSET);
+	iowrite32(0, mfld_fw_upd.mailbox + IA_FLAG_OFFSET);
+
+	fws = kmalloc(MAX_FW_CHUNK, GFP_KERNEL);
+	if (fws == NULL) {
+		ret_val = -ENOMEM;
+		goto unmap_mb;
+	}
+
+	/* TODO_SK::There is just
+	 *  1 write required from IA side for DFU.
+	 *  So commenting this-out, until it gets confirmed */
+	/*ipc_command(IPC_CMD_FW_UPDATE_READY); */
+
+	/*1. DNX SIZE HEADER   */
+	ret_val = copy_from_user(fws, fw_ud_param.dnx_hdr, DNX_HDR_LEN);
+	if (ret_val < 0) {
+		ret_val = -EFAULT;
+		goto term;
+	}
+
+	memcpy_toio(mfld_fw_upd.sram, fws, DNX_HDR_LEN);
+
+	/* There are synchronization issues between IA and SCU */
+	mb();
+
+	/* Write cmd to trigger an interrupt to SCU for firmware update*/
+	ipc_command(IPC_CMD_FW_UPDATE_GO);
+
+	mfld_fw_upd.wscu = !mfld_fw_upd.wscu;
+
+	ret_val = busy_wait(&mfld_fw_upd);
+	if (ret_val < 0)
+		goto term;
+
+	ret_val = check_mb_status(DNX_IMAGE, &mfld_fw_upd);
+	if (ret_val < 0)
+		goto term;
+
+	/*2. DNX FILE   */
+	ret_val = process_fw_chunk(fws, fw_ud_param.dnx_file_data,
+				      fw_ud_param.dnx_size, &mfld_fw_upd);
+	if (ret_val < 0) {
+		dev_err(&ipcdev.pdev->dev, "Error fw chunk=%s\n", DNX_IMAGE);
+		goto term;
+	}
+
+	ret_val = check_mb_status(FUPH_HDR_SIZE, &mfld_fw_upd);
+	if (ret_val < 0)
+		goto term;
+
+	iowrite32(FUPH_HDR_LEN, mfld_fw_upd.sram);
+
+	/* There are synchronization issues between IA and SCU */
+	mb();
+	dev_dbg(&ipcdev.pdev->dev,
+		"copied fuph hdr size=%d\n", ioread32(mfld_fw_upd.sram));
+
+	mfld_fw_upd.wia = !(mfld_fw_upd.wia);
+	iowrite32(mfld_fw_upd.wia, mfld_fw_upd.mailbox + IA_FLAG_OFFSET);
+
+	dev_dbg(&ipcdev.pdev->dev, "ia_flag=%d\n",
+		ioread32(mfld_fw_upd.mailbox + IA_FLAG_OFFSET));
+
+	mb();
+
+	mfld_fw_upd.wscu = !mfld_fw_upd.wscu;
+	
+	ret_val = busy_wait(&mfld_fw_upd);
+	if (ret_val < 0)
+		goto term;
+
+	ret_val = check_mb_status(FUPH, &mfld_fw_upd);
+	if (ret_val < 0) {
+		dev_err(&ipcdev.pdev->dev,
+			"error after FUPH hdrsize, IA quitting\n");
+		goto term;
+	}
+
+	/* 3. FUPH HEADER   */
+	fuph_ptr = fw_file_data + (fw_ud_param.fsize - 1) - (FUPH_HDR_LEN - 1);
+	
+	ret_val = process_fw_chunk(fws, fuph_ptr, FUPH_HDR_LEN, &mfld_fw_upd);
+	if (ret_val < 0) {
+		dev_err(&ipcdev.pdev->dev, "Error fw chunk=%s\n", FUPH);
+		goto term;
+	}
+
+	/* TODO: Fix this function, to make it handle more than 1 string
+	 * At this point, if MIP size is 0 in FUPH, then SCU can jump to LOFW.
+	 */
+	ret_val = check_mb_status(MIP, &mfld_fw_upd);
+	if (ret_val < 0)
+		goto term;
+
+	ret_val = check_mb_status(LOWER_128K, &mfld_fw_upd);
+	if (ret_val < 0)
+		goto term;
+
+	if ((strncmp(mfld_fw_upd.mb_status, MIP,
+					strlen(mfld_fw_upd.mb_status)) == 0)) {
+		/* 4. MIP HEADER */
+		ret_val = process_fw_chunk(fws, 
+				fw_file_data + MIP_HEADER_OFFSET,
+				MIP_HEADER_LEN, &mfld_fw_upd);
+		if (ret_val < 0) {
+			dev_err(&ipcdev.pdev->dev, "Error fw chunk=%s\n", MIP);
+			goto term;
+		}
+
+		ret_val = check_mb_status(LOWER_128K, &mfld_fw_upd);
+		if (ret_val < 0)
+			goto term;
+	}
+
+	/* 5. LOWER 128K */
+	ret_val = process_fw_chunk(fws, fw_file_data + LOWER_128K_OFFSET,
+			      MAX_FW_CHUNK, &mfld_fw_upd);
+	if (ret_val < 0) {
+		dev_err(&ipcdev.pdev->dev, "Error fw chunk=%s\n", LOWER_128K);
+		goto term;
+	}
+
+	ret_val = check_mb_status(UPPER_128K, &mfld_fw_upd);
+	if (ret_val < 0)
+		goto term;
+
+	/* 6. UPPER 128K */
+	ret_val = process_fw_chunk(fws, fw_file_data + UPPER_128K_OFFSET,
+					      MAX_FW_CHUNK, &mfld_fw_upd);
+	if (ret_val < 0) {
+		dev_err(&ipcdev.pdev->dev, "Error fw chunk=%s\n", UPPER_128K);
+		goto term;
+	}
+	ret_val = check_mb_status(UPDATE_DONE, &mfld_fw_upd);
+term:
+	kfree(fws);
+unmap_mb:
+	iounmap(mfld_fw_upd.mailbox);
+unmap_sram:
+	iounmap(mfld_fw_upd.sram);
+out_unlock:
+	mutex_unlock(&ipclock);
+	return ret_val;
+}
+EXPORT_SYMBOL_GPL(intel_scu_ipc_medfw_upgrade);
+
 /*
  * Interrupt handler gets called when ioc bit of IPC_COMMAND_REG set to 1
  * When ioc bit is set to 1, caller api must wait for interrupt handler called
diff --git a/drivers/platform/x86/intel_scu_ipcutil.c b/drivers/platform/x86/intel_scu_ipcutil.c
index b93a032..0a77900 100644
--- a/drivers/platform/x86/intel_scu_ipcutil.c
+++ b/drivers/platform/x86/intel_scu_ipcutil.c
@@ -33,6 +33,7 @@ static u32 major;
 #define INTE_SCU_IPC_REGISTER_WRITE	1
 #define INTE_SCU_IPC_REGISTER_UPDATE	2
 #define INTE_SCU_IPC_FW_UPDATE		0xA2
+#define INTE_SCU_IPC_MEDFIELD_FW_UPDATE	0xA3
 
 struct scu_ipc_data {
 	u32     count;  /* No. of registers */
@@ -88,18 +89,23 @@ static long scu_ipc_ioctl(struct file *fp, unsigned int cmd,
 	if (!capable(CAP_SYS_RAWIO))
 		return -EPERM;
 
-	if (cmd == INTE_SCU_IPC_FW_UPDATE) {
-			u8 *fwbuf = kmalloc(MAX_FW_SIZE, GFP_KERNEL);
-			if (fwbuf == NULL)
-				return -ENOMEM;
-			if (copy_from_user(fwbuf, (u8 *)arg, MAX_FW_SIZE)) {
-				kfree(fwbuf);
-				return -EFAULT;
-			}
-			ret = intel_scu_ipc_fw_update(fwbuf, MAX_FW_SIZE);
+	switch (cmd) {
+	case INTE_SCU_IPC_FW_UPDATE:
+	{
+		u8 *fwbuf = kmalloc(MAX_FW_SIZE, GFP_KERNEL);
+		if (fwbuf == NULL)
+			return -ENOMEM;
+		if (copy_from_user(fwbuf, (u8 *)arg, MAX_FW_SIZE)) {
 			kfree(fwbuf);
-			return ret;
-	} else {
+			return -EFAULT;
+		}
+		ret = intel_scu_ipc_fw_update(fwbuf, MAX_FW_SIZE);
+		kfree(fwbuf);
+		return ret;
+	}
+	case INTE_SCU_IPC_MEDFIELD_FW_UPDATE:
+		return intel_scu_ipc_medfw_upgrade(argp);
+	default:
 		if (copy_from_user(&data, argp, sizeof(struct scu_ipc_data)))
 			return -EFAULT;
 		ret = scu_reg_access(cmd, &data);
