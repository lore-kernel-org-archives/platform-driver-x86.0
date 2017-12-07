From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v7 7/8] fs/pipe.c: export create_pipe_files()
Date: Thu,  7 Dec 2017 03:54:07 +0200
Message-ID: <20171207015614.7914-8-jarkko.sakkinen@linux.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Alexander Viro <viro@zeniv.linux.org.uk>, "open list:FILESYSTEMS VFS and
        infrastructure" <linux-fsdevel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Exported create_pipe_files() because the SGX driver needs to be able to
setup pipes for communicating with the helper process that hosts the
Launch Enclave (LE). The pipe creation will be done in the init-callback
supplied to call_usermodehelper_setup().

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
Could be removed if LE is moved to arch.
 fs/pipe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/pipe.c b/fs/pipe.c
index 6d98566201ef..4846886b0530 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -785,6 +785,7 @@ int create_pipe_files(struct file **res, int flags)
 	iput(inode);
 	return err;
 }
+EXPORT_SYMBOL_GPL(create_pipe_files);
 
 static int __do_pipe_flags(int *fd, struct file **files, int flags)
 {
-- 
2.14.1
