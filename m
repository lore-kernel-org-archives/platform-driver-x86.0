From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v7 5/8] intel_sgx: ptrace() support
Date: Thu,  7 Dec 2017 03:54:05 +0200
Message-ID: <20171207015614.7914-6-jarkko.sakkinen@linux.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Implemented VMA callbacks in order to ptrace() debug enclaves. With
debug enclaves data can be read and write the memory word at a time by
using ENCLS(EDBGRD) and ENCLS(EDBGWR) leaf instructions.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 drivers/platform/x86/intel_sgx/sgx_vma.c | 119 +++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/platform/x86/intel_sgx/sgx_vma.c b/drivers/platform/x86/intel_sgx/sgx_vma.c
index 481f671f10ca..2bce40ef6823 100644
--- a/drivers/platform/x86/intel_sgx/sgx_vma.c
+++ b/drivers/platform/x86/intel_sgx/sgx_vma.c
@@ -110,8 +110,127 @@ static int sgx_vma_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 }
 
+static int sgx_edbgrd(struct sgx_encl *encl, struct sgx_encl_page *page,
+		      unsigned long addr, void *data)
+{
+	unsigned long offset;
+	void *ptr;
+	int ret;
+
+	offset = addr & ~PAGE_MASK;
+
+	if ((page->desc & SGX_ENCL_PAGE_TCS) &&
+	    (offset + sizeof(unsigned long)) >
+	    offsetof(struct sgx_tcs, reserved))
+		return -ECANCELED;
+
+	ptr = sgx_get_page(page->epc_page);
+	ret = __edbgrd((unsigned long)ptr + offset, data);
+	sgx_put_page(ptr);
+	if (ret) {
+		sgx_dbg(encl, "EDBGRD returned %d\n", ret);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int sgx_edbgwr(struct sgx_encl *encl, struct sgx_encl_page *page,
+		      unsigned long addr, void *data)
+{
+	unsigned long offset;
+	void *ptr;
+	int ret;
+
+	offset = addr & ~PAGE_MASK;
+
+	/* Writing anything else than flags will cause #GP */
+	if ((page->desc & SGX_ENCL_PAGE_TCS) &&
+	    offset < offsetof(struct sgx_tcs, flags) &&
+	    (offset + sizeof(unsigned long)) >
+	    offsetof(struct sgx_tcs, flags))
+		return -ECANCELED;
+
+	ptr = sgx_get_page(page->epc_page);
+	ret = __edbgwr((unsigned long)ptr + offset, data);
+	sgx_put_page(ptr);
+	if (ret) {
+		sgx_dbg(encl, "EDBGWR returned %d\n", ret);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int sgx_vma_access(struct vm_area_struct *vma, unsigned long addr,
+			  void *buf, int len, int write)
+{
+	struct sgx_encl *encl = vma->vm_private_data;
+	struct sgx_encl_page *entry = NULL;
+	unsigned long align;
+	char data[sizeof(unsigned long)];
+	int offset;
+	int cnt;
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
+	for (i = 0; i < len; i += cnt) {
+		if (!entry || !((addr + i) & (PAGE_SIZE - 1))) {
+			if (entry)
+				entry->desc &= ~SGX_ENCL_PAGE_RESERVED;
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
+		/* Locking is not needed because only immutable fields of the
+		 * page are accessed and page itself is reserved so that it
+		 * cannot be swapped out in the middle.
+		 */
+
+		align = ALIGN_DOWN(addr + i, sizeof(unsigned long));
+		offset = (addr + i) & (sizeof(unsigned long) - 1);
+		cnt = sizeof(unsigned long) - offset;
+		cnt = min(cnt, len - i);
+
+		ret = sgx_edbgrd(encl, entry, align, data);
+		if (ret)
+			return ret;
+
+		memcpy(data + offset, buf + i, cnt);
+
+		if (write) {
+			ret = sgx_edbgwr(encl, entry, align, data);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (entry)
+		entry->desc &= ~SGX_ENCL_PAGE_RESERVED;
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
