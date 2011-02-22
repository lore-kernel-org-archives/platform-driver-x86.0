From: Mattia Dongili <malattia@linux.it>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Tue, 22 Feb 2011 20:46:01 +0900
Message-ID: <20110222114601.GA936@kamineko.org>
References: <20110222162206.c3fb0636.sfr@canb.auug.org.au>
 <a8c6f32c-ccb5-4f65-b537-8bd1c11f7336@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a8c6f32c-ccb5-4f65-b537-8bd1c11f7336@email.android.com>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 22, 2011 at 03:26:53PM +0900, Mattia Dongili wrote:
> 
> 
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> >Hi Matthew,
> >
> >After merging the drivers-x86 tree, today's linux-next build (x86_64
> >allmodconfig) failed like this:
> 
> Apologies, I didn't test my code with
> DEBUG_LOCK_ALLOC=y.
> I'll send a fix in as soon as I get around a usable network
> connection.

the below patch fixes the build failure.

how does linux-next work? should this patch be a separate commit or can
it be folded into the offending one?

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index a097a27..a0ba0e7 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -769,7 +769,7 @@ static int sony_nc_handles_setup(struct platform_device *pd)
 
 	handles = kzalloc(sizeof(*handles), GFP_KERNEL);
 
-	sysfs_attr_init(handles->devattr);
+	sysfs_attr_init(&handles->devattr.attr);
 	handles->devattr.attr.name = "handles";
 	handles->devattr.attr.mode = S_IRUGO;
 	handles->devattr.show = sony_nc_handles_show;
@@ -1459,13 +1459,13 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
 
 	kbdbl_handle = kzalloc(sizeof(*kbdbl_handle), GFP_KERNEL);
 
-	sysfs_attr_init(kbdbl_handle->mode_attr);
+	sysfs_attr_init(&kbdbl_handle->mode_attr.attr);
 	kbdbl_handle->mode_attr.attr.name = "kbd_backlight";
 	kbdbl_handle->mode_attr.attr.mode = S_IRUGO | S_IWUSR;
 	kbdbl_handle->mode_attr.show = sony_nc_kbd_backlight_mode_show;
 	kbdbl_handle->mode_attr.store = sony_nc_kbd_backlight_mode_store;
 
-	sysfs_attr_init(kbdbl_handle->timeout_attr);
+	sysfs_attr_init(&kbdbl_handle->timeout_attr.attr);
 	kbdbl_handle->timeout_attr.attr.name = "kbd_backlight_timeout";
 	kbdbl_handle->timeout_attr.attr.mode = S_IRUGO | S_IWUSR;
 	kbdbl_handle->timeout_attr.show = sony_nc_kbd_backlight_timeout_show;
-- 
mattia
:wq!
