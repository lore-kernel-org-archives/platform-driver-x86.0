From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC v3 06/12] fs/pipe.c: export create_pipe_files() and replace_fd()
Date: Tue, 10 Oct 2017 17:32:52 +0300
Message-ID: <20171010143258.21623-7-jarkko.sakkinen@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:21585 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755866AbdJJOd3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 10:33:29 -0400
In-Reply-To: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Export create_pipe_files() and replace_fd() so that the SGX driver is
able to create stdin and stdout pipes.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 fs/file.c | 1 +
 fs/pipe.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/file.c b/fs/file.c
index 1fc7fbbb4510..b1fa28919b22 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -871,6 +871,7 @@ int replace_fd(unsigned fd, struct file *file, unsigned flags)
 	spin_unlock(&files->file_lock);
 	return err;
 }
+EXPORT_SYMBOL_GPL(replace_fd);
 
 SYSCALL_DEFINE3(dup3, unsigned int, oldfd, unsigned int, newfd, int, flags)
 {
diff --git a/fs/pipe.c b/fs/pipe.c
index 97e5be897753..ee33a84127e7 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -784,6 +784,7 @@ int create_pipe_files(struct file **res, int flags)
 	iput(inode);
 	return err;
 }
+EXPORT_SYMBOL_GPL(create_pipe_files);
 
 static int __do_pipe_flags(int *fd, struct file **files, int flags)
 {
-- 
2.14.1
