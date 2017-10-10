From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC v3 08/12] intel_sgx: ptrace() support
Date: Tue, 10 Oct 2017 17:32:54 +0300
Message-ID: <20171010143258.21623-9-jarkko.sakkinen@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:50599 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932225AbdJJOda (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 10:33:30 -0400
In-Reply-To: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Implemented VMA callbacks in order to ptrace() debug enclaves.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/platform/x86/intel_sgx/sgx_vma.c | 115 +++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/drivers/platform/x86/intel_sgx/sgx_vma.c b/drivers/platform/x86/intel_sgx/sgx_vma.c
index 29dd09f142c5..f83c0b8c7445 100644
--- a/drivers/platform/x86/intel_sgx/sgx_vma.c
+++ b/drivers/platform/x86/intel_sgx/sgx_vma.c
@@ -108,8 +108,123 @@ static int sgx_vma_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 }
 
+static inline int sgx_vma_access_word(struct sgx_encl *encl,
+				      unsigned long addr,
+				      void *buf,
+				      int len,
+				      int write,
+				      struct sgx_encl_page *encl_page,
+				      int i)
+{
+	char data[sizeof(unsigned long)];
+	int align, cnt, offset;
+	void *vaddr;
+	int ret;
+
+	offset = ((addr + i) & (PAGE_SIZE - 1)) & ~(sizeof(unsigned long) - 1);
+	align = (addr + i) & (sizeof(unsigned long) - 1);
+	cnt = sizeof(unsigned long) - align;
+	cnt = min(cnt, len - i);
+
+	if (write) {
+		if (encl_page->flags & SGX_ENCL_PAGE_TCS &&
+		    (offset < 8 || (offset + (len - i)) > 16))
+			return -ECANCELED;
+
+		if (align || (cnt != sizeof(unsigned long))) {
+			vaddr = sgx_get_page(encl_page->epc_page);
+			ret = __edbgrd((void *)((unsigned long)vaddr + offset),
+				       (unsigned long *)data);
+			sgx_put_page(vaddr);
+			if (ret) {
+				sgx_dbg(encl, "EDBGRD returned %d\n", ret);
+				return -EFAULT;
+			}
+		}
+
+		memcpy(data + align, buf + i, cnt);
+		vaddr = sgx_get_page(encl_page->epc_page);
+		ret = __edbgwr((void *)((unsigned long)vaddr + offset),
+			       (unsigned long *)data);
+		sgx_put_page(vaddr);
+		if (ret) {
+			sgx_dbg(encl, "EDBGWR returned %d\n", ret);
+			return -EFAULT;
+		}
+	} else {
+		if (encl_page->flags & SGX_ENCL_PAGE_TCS &&
+		    (offset + (len - i)) > 72)
+			return -ECANCELED;
+
+		vaddr = sgx_get_page(encl_page->epc_page);
+		ret = __edbgrd((void *)((unsigned long)vaddr + offset),
+			       (unsigned long *)data);
+		sgx_put_page(vaddr);
+		if (ret) {
+			sgx_dbg(encl, "EDBGRD returned %d\n", ret);
+			return -EFAULT;
+		}
+
+		memcpy(buf + i, data + align, cnt);
+	}
+
+	return cnt;
+}
+
+static int sgx_vma_access(struct vm_area_struct *vma, unsigned long addr,
+			  void *buf, int len, int write)
+{
+	struct sgx_encl *encl = vma->vm_private_data;
+	struct sgx_encl_page *entry = NULL;
+	const char *op_str = write ? "EDBGWR" : "EDBGRD";
+	int ret = 0;
+	int i;
+
+	/* If process was forked, VMA is still there but vm_private_data is set
+	 * to NULL.
+	 */
+	if (!encl)
+		return -EFAULT;
+
+	if (!(encl->flags & SGX_ENCL_DEBUG) ||
+	    !(encl->flags & SGX_ENCL_INITIALIZED) ||
+	    (encl->flags & SGX_ENCL_DEAD))
+		return -EFAULT;
+
+	sgx_dbg(encl, "%s addr=0x%lx, len=%d\n", op_str, addr, len);
+
+	for (i = 0; i < len; i += ret) {
+		if (!entry || !((addr + i) & (PAGE_SIZE - 1))) {
+			if (entry)
+				entry->flags &= ~SGX_ENCL_PAGE_RESERVED;
+
+			entry = sgx_fault_page(vma, (addr + i) & PAGE_MASK,
+					       SGX_FAULT_RESERVE);
+			if (IS_ERR(entry)) {
+				ret = PTR_ERR(entry);
+				entry = NULL;
+				break;
+			}
+		}
+
+		/* No locks are needed because used fields are immutable after
+		 * intialization.
+		 */
+		ret = sgx_vma_access_word(encl, addr, buf, len, write,
+					  entry, i);
+		if (ret < 0)
+			break;
+	}
+
+	if (entry)
+		entry->flags &= ~SGX_ENCL_PAGE_RESERVED;
+
+	return (ret < 0 && ret != -ECANCELED) ? ret : i;
+}
+
 const struct vm_operations_struct sgx_vm_ops = {
 	.close = sgx_vma_close,
 	.open = sgx_vma_open,
 	.fault = sgx_vma_fault,
+	.access = sgx_vma_access,
 };
-- 
2.14.1
