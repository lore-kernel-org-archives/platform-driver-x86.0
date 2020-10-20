Return-Path: <SRS0=42+Y=D3=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87527C4363A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Oct 2020 20:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E3162225F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Oct 2020 20:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YGZfSu79"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438556AbgJTU7P (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Oct 2020 16:59:15 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:48068 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438555AbgJTU7P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Oct 2020 16:59:15 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09KKsPeB105624;
        Tue, 20 Oct 2020 20:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=eLjVCX8gqWDojFybn4tXTm6fgynmVd6hi37/kA5hySQ=;
 b=YGZfSu79Ums6m8gaMZkPDPxDO9sY43frGM3v0iuwFcBS+Y8q4dOTcmwqu8hifaVt5wnQ
 78akDUF9ipeZoZAOMNJON5bt+fvuCK+YiQE0WvvYSK77aSaG4robhBnyiiDe7EgLDl+f
 fFZXrlFPXT4XeFY69irY+sR6Xf5nR228uhzeldawyroOhj3hfsARpsP0c8LIbwCP/tI+
 dCQajyKA+TXPXJpmnfKmJpnBIH9A0O6M4IaHG6lY2k/1dfWyCFrQjNlwT/5/kQTqnkZB
 dRx9NBMpDLTgXe1eXxOzgEwtbkqU1cI2yt9o+Gx0AXs0qoQXRpE6eKqJIvTYKsHMDGWF FA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 347s8mwa2q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Oct 2020 20:58:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09KKsud1144186;
        Tue, 20 Oct 2020 20:58:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 348ahwrm8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Oct 2020 20:58:40 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09KKwWaR018091;
        Tue, 20 Oct 2020 20:58:32 GMT
Received: from char.us.oracle.com (/10.152.32.25)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 20 Oct 2020 13:58:32 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
        id 687516A00D6; Tue, 20 Oct 2020 17:00:08 -0400 (EDT)
From:   Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To:     eric.snowberg@oracle.com, john.haxby@oracle.com,
        todd.vierling@oracle.com
Cc:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        David Howells <dhowells@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Thomas Gleixner <tglx@linutronix.de>, Greg KH <greg@kroah.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>
Subject: [PATCH RFC UEK5 5/7] debugfs: Restrict debugfs when the kernel is locked down
Date:   Tue, 20 Oct 2020 17:00:02 -0400
Message-Id: <20201020210004.18977-6-konrad.wilk@oracle.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20201020210004.18977-1-konrad.wilk@oracle.com>
References: <20201020210004.18977-1-konrad.wilk@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010200142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010200142
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Disallow opening of debugfs files that might be used to muck around when
the kernel is locked down as various drivers give raw access to hardware
through debugfs.  Given the effort of auditing all 2000 or so files and
manually fixing each one as necessary, I've chosen to apply a heuristic
instead.  The following changes are made:

 (1) chmod and chown are disallowed on debugfs objects (though the root dir
     can be modified by mount and remount, but I'm not worried about that).

 (2) When the kernel is locked down, only files with the following criteria
     are permitted to be opened:

        - The file must have mode 00444
        - The file must not have ioctl methods
        - The file must not have mmap

 (3) When the kernel is locked down, files may only be opened for reading.

Normal device interaction should be done through configfs, sysfs or a
miscdev, not debugfs.

Note that this makes it unnecessary to specifically lock down show_dsts(),
show_devs() and show_call() in the asus-wmi driver.

I would actually prefer to lock down all files by default and have the
the files unlocked by the creator.  This is tricky to manage correctly,
though, as there are 19 creation functions and ~1600 call sites (some of
them in loops scanning tables).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Andy Shevchenko <andy.shevchenko@gmail.com>
cc: acpi4asus-user@lists.sourceforge.net
cc: platform-driver-x86@vger.kernel.org
cc: Matthew Garrett <mjg59@srcf.ucam.org>
cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg KH <greg@kroah.com>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Matthew Garrett <matthewgarrett@google.com>
Signed-off-by: James Morris <jmorris@namei.org>

[Backport:
 Since UEK5 by default is confidentiality we have to outright
 disallow debugfs if the default mode is selected. Hence the
 call to __kernel_is_confidentiality_mode to help us.

 If we are in integrity lockdown mode, we can enable debugfs
 IF they match with the above 1-3 criteria]

Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 fs/debugfs/file.c    | 36 +++++++++++++++++++++++++++++++++---
 fs/debugfs/inode.c   | 34 ++++++++++++++++++++++++++++++++--
 security/lock_down.c |  1 +
 3 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 32b5168a7e910..86c7235dfd57b 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -97,15 +97,35 @@ EXPORT_SYMBOL_GPL(debugfs_use_file_finish);
 
 #define F_DENTRY(filp) ((filp)->f_path.dentry)
 
+
+/*
+ * Only permit access to world-readable files when the kernel is locked down.
+ * We also need to exclude any file that has ways to write or alter it as root
+ * can bypass the permissions check.
+ */
+static bool debugfs_is_locked_down(struct inode *inode,
+				   struct file *filp,
+				   const struct file_operations *real_fops)
+{
+	if (__kernel_is_confidentiality_mode())
+		return true;
+
+	if ((inode->i_mode & 07777) == 0444 &&
+	    !(filp->f_mode & FMODE_WRITE) &&
+	    !real_fops->unlocked_ioctl &&
+	    !real_fops->compat_ioctl &&
+	    !real_fops->mmap)
+		return false;
+
+	return kernel_is_locked_down("debugfs");
+}
+
 static int open_proxy_open(struct inode *inode, struct file *filp)
 {
 	const struct dentry *dentry = F_DENTRY(filp);
 	const struct file_operations *real_fops = NULL;
 	int srcu_idx, r;
 
-	if (kernel_is_locked_down("debugfs"))
-		return -EPERM;
-
 	r = debugfs_use_file_start(dentry, &srcu_idx);
 	if (r) {
 		r = -ENOENT;
@@ -113,6 +133,11 @@ static int open_proxy_open(struct inode *inode, struct file *filp)
 	}
 
 	real_fops = debugfs_real_fops(filp);
+
+	r = debugfs_locked_down(inode, filp, real_fops);
+	if (r)
+		goto out;
+
 	real_fops = fops_get(real_fops);
 	if (!real_fops) {
 		/* Huh? Module did not clean up after itself at exit? */
@@ -245,6 +270,11 @@ static int full_proxy_open(struct inode *inode, struct file *filp)
 	}
 
 	real_fops = debugfs_real_fops(filp);
+
+	r = debugfs_is_locked_down(inode, filp, real_fops);
+	if (r)
+		goto out;
+
 	real_fops = fops_get(real_fops);
 	if (!real_fops) {
 		/* Huh? Module did not cleanup after itself at exit? */
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index f4df6feec2713..5a42b2387dd07 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -39,6 +39,35 @@ static struct vfsmount *debugfs_mount;
 static int debugfs_mount_count;
 static bool debugfs_registered;
 
+/*
+ * Don't allow access attributes to be changed whilst the kernel is locked down
+ * so that we can use the file mode as part of a heuristic to determine whether
+ * to lock down individual files.
+ */
+static int debugfs_setattr(struct dentry *dentry, struct iattr *ia)
+{
+	int ret;
+
+	if (kernel_is_locked_down("debugfs"))
+		ret = -EPERM;
+
+	if (ret && (ia->ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID)))
+		return ret;
+	return simple_setattr(dentry, ia);
+}
+
+static const struct inode_operations debugfs_file_inode_operations = {
+	.setattr	= debugfs_setattr,
+};
+static const struct inode_operations debugfs_dir_inode_operations = {
+	.lookup		= simple_lookup,
+	.setattr	= debugfs_setattr,
+};
+static const struct inode_operations debugfs_symlink_inode_operations = {
+	.get_link	= simple_get_link,
+	.setattr	= debugfs_setattr,
+};
+
 static struct inode *debugfs_get_inode(struct super_block *sb)
 {
 	struct inode *inode = new_inode(sb);
@@ -362,6 +391,7 @@ static struct dentry *__debugfs_create_file(const char *name, umode_t mode,
 	inode->i_mode = mode;
 	inode->i_private = data;
 
+	inode->i_op = &debugfs_file_inode_operations;
 	inode->i_fop = proxy_fops;
 	dentry->d_fsdata = (void *)real_fops;
 
@@ -518,7 +548,7 @@ struct dentry *debugfs_create_dir(const char *name, struct dentry *parent)
 		return failed_creating(dentry);
 
 	inode->i_mode = S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
-	inode->i_op = &simple_dir_inode_operations;
+	inode->i_op = &debugfs_dir_inode_operations;
 	inode->i_fop = &simple_dir_operations;
 
 	/* directory inodes start off with i_nlink == 2 (for "." entry) */
@@ -613,7 +643,7 @@ struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 		return failed_creating(dentry);
 	}
 	inode->i_mode = S_IFLNK | S_IRWXUGO;
-	inode->i_op = &simple_symlink_inode_operations;
+	inode->i_op = &debugfs_symlink_inode_operations;
 	inode->i_link = link;
 	d_instantiate(dentry, inode);
 	return end_creating(dentry);
diff --git a/security/lock_down.c b/security/lock_down.c
index 1301b25137127..c709c70701235 100644
--- a/security/lock_down.c
+++ b/security/lock_down.c
@@ -61,6 +61,7 @@ bool __kernel_is_locked_down(const char *what, bool first)
 		/* If we are in integrity mode we allow certain callsites */
 		if (!lockdown_confidentiality) {
 			if ((strcmp(what, "BPF") == 0) ||
+			    (strcmp(what, "debugfs") == 0) ||
 			    (strcmp(what, "DTRACE") == 0)) {
 				return 0;
 			}
-- 
2.13.6

