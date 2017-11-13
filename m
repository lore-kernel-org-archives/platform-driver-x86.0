From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v5 09/11] fs/pipe.c: export create_pipe_files() and replace_fd()
Date: Mon, 13 Nov 2017 21:45:26 +0200
Message-ID: <20171113194528.28557-10-jarkko.sakkinen@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Exported create_pipe_files() and replace_fd() because the SGX driver
needs to be able to setup pipes in order to communicate with the helper
process that hosts the Launch Enclave (LE). The pipe creation will be
done in the init-callback supplied to call_usermodehelper_setup().

The driver will use two pipes for communication with the LE hosting
process:

* One for writing SIGSTRUCT blobs.
* One for reading EINITTOKEN blobs.

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
