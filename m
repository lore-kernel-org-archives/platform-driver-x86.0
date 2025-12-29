Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F5264627;
	Mon, 29 Dec 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023971; cv=none; b=gPsup9rf3IWSgrn0juJIN5Fgci5gHx50pQnJgv4t3Hdo4qbSPO/RQnD23zaFBvkD8dS3ukElS7emuLBSSAZxiyqz+wjd6GwKoKLEuQ6vkyaMjDQbZNNEmSKjVzrYpQOcGLaYNJjdsWGF7dazJBE9ZiK5ubnj/b6zDgcSSv/8ByA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023971; c=relaxed/simple;
	bh=6eyWDnoasiHD4OxdOw+HhOv3RiSe8buhg4Hh9vgkHlw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tS0UzJ/idvhmmaI/Vfmwn6s6WgXbfVO6D6H/uXaqL8+sTZxznfJg2pAQEXkWxsPB2/aX631Ysdt/e+oZpU3A8xK7t/y9hDgfBd9aC67xtMEPY3rlbB/ywcqhCvKydiKtuhxpvnzzAahtCU8ao++X/+IXSWV8sVpcmzAjFAa6Q24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkHC4Yia; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkHC4Yia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767023969; x=1798559969;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6eyWDnoasiHD4OxdOw+HhOv3RiSe8buhg4Hh9vgkHlw=;
  b=HkHC4YiaO2N34roI9eHV7760H9iIOmoX3SH9GXAjgFFJ2YhWHj1AvjRa
   lMPfg8ry4LjTw8J0GTnJsTIz1eZIwpsyNfrKa/a0KTrtOyILZfOhCXUhm
   9yhld77lJey8dRub6d3NhEKB03kPylECLlt3kIcBjdnzJOeYh8cZyinIJ
   bPDG/MIiVoqPWTc4uzPgOPV9FxhOZiByG/PgKMyBQgCYn+AMB6LOlb12G
   SY1NuqxLlI079wrLTiT4pVub8s0vboZP5mEFyPzzMFobOeZmehw3BKE3s
   1i4gzRCpNOn3nKx9qCXxyRSYPa/9eYrkC6mE2/LLlGdFuRd8QbIntHjLg
   Q==;
X-CSE-ConnectionGUID: rpuBE4JpStaM+JAQQbsXOA==
X-CSE-MsgGUID: 9dI18GyKSrKUofE6rZREQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68793294"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="68793294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 07:59:29 -0800
X-CSE-ConnectionGUID: OiZMmEWUQHiE6C1cMYRHjw==
X-CSE-MsgGUID: BTVYszdKTeCteDqWZ+Tulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="200664487"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 07:59:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 17:59:22 +0200 (EET)
To: Benjamin Philip <benjamin.philip495@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
In-Reply-To: <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
Message-ID: <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com> <20251223191932.946794-1-benjamin.philip495@gmail.com> <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com> <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
 <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Dec 2025, Benjamin Philip wrote:
> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
> >> This commit handles some column limit overflows (that occur after fixing
> >> their alignment), i.e. the following check:
> >>
> >> CHECK: line length of ... exceeds 100 columns
> >>
> >> by defining a constant opt, and replacing the offending
> >> expression with opt.
> >>
> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> >> ---
> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++----------
> >>  1 file changed, 19 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
> >> b/drivers/platform/x86/lenovo/think-lmi.c
> >> index 1ada4d800383..07ba0d84720a 100644
> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject *kobj,
> >> struct kobj_attribute *attr,
> >>  }
> >>
> >>  static ssize_t current_value_store(struct kobject *kobj,
> >> -		struct kobj_attribute *attr,
> >> -		const char *buf, size_t count)
> >> +				   struct kobj_attribute *attr, const char *buf,
> >> +				   size_t count)
> >>  {
> >>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> >>  	char *set_str = NULL, *new_setting = NULL;
> >>  	char *auth_str = NULL;
> >> +	const char *opt;
> >>  	int ret;
> >>
> >>  	if (!tlmi_priv.can_set_bios_settings)
> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(struct kobject *kobj,
> >>  			ret = tlmi_save_bios_settings("");
> >>  	} else { /* old non-opcode based authentication method (deprecated) */
> >>  		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
> >> +			opt = encoding_options[tlmi_priv.pwd_admin->encoding];
> >>  			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> >> -					tlmi_priv.pwd_admin->password,
> >> -					encoding_options[tlmi_priv.pwd_admin->encoding],
> >> -					tlmi_priv.pwd_admin->kbdlang);
> >> +					     tlmi_priv.pwd_admin->password,
> >> +					     opt,
> >> +					     tlmi_priv.pwd_admin->kbdlang);
> >>  			if (!auth_str) {
> >>  				ret = -ENOMEM;
> >>  				goto out;
> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
> >> kobject *kobj, struct kobj_attribute *
> >>  				   const char *buf, size_t count)
> >>  {
> >>  	char *auth_str = NULL;
> >> +	const char *opt;
> >>  	int ret = 0;
> >>  	int cmd;
> >>
> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
> >> kobject *kobj, struct kobj_attribute *
> >>  			ret = tlmi_save_bios_settings("");
> >>  		} else { /* old non-opcode based authentication method (deprecated) */
> >>  			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
> >> +				opt = encoding_options[tlmi_priv.pwd_admin->encoding];
> >>  				auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> >>  						     tlmi_priv.pwd_admin->password,
> >> -						     encoding_options[tlmi_priv.pwd_admin->encoding],
> >> +						     opt,
> >>  						     tlmi_priv.pwd_admin->kbdlang);
> >>  				if (!auth_str) {
> >>  					ret = -ENOMEM;
> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(struct
> >> kobject *kobj, struct kobj_attribute *
> >>  static struct kobj_attribute save_settings = __ATTR_RW(save_settings);
> >>
> >>  /* ---- Debug
> >> interface---------------------------------------------------------
> >> */
> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
> >> kobj_attribute *attr,
> >> -				const char *buf, size_t count)
> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
> >> +			       struct kobj_attribute *attr, const char *buf,
> >> +			       size_t count)
> >>  {
> >>  	char *set_str = NULL, *new_setting = NULL;
> >>  	char *auth_str = NULL;
> >> +	const char *opt;
> >>  	int ret;
> >>
> >>  	if (!tlmi_priv.can_debug_cmd)
> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct kobject
> >> *kobj, struct kobj_attribute *attr
> >>  		return -ENOMEM;
> >>
> >>  	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
> >> +		opt = encoding_options[tlmi_priv.pwd_admin->encoding];
> >>  		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> >> -				tlmi_priv.pwd_admin->password,
> >> -				encoding_options[tlmi_priv.pwd_admin->encoding],
> >> -				tlmi_priv.pwd_admin->kbdlang);
> >> +				     tlmi_priv.pwd_admin->password,
> >> +				     opt,
> >> +				     tlmi_priv.pwd_admin->kbdlang);
> >>  		if (!auth_str) {
> >>  			ret = -ENOMEM;
> >>  			goto out;
> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
> >>  						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
> >>  			}
> >>  			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
> >> -					tlmi_priv.pwdcfg.ext.nvme_master_password) {
> >> +			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
> >>  				tlmi_priv.pwd_nvme->pwd_enabled = true;
> >>  				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
> >>  					tlmi_priv.pwd_nvme->index =
> >> --
> >> 2.52.0
> >
> > I'll defer to the pdx86 reviewers for this set of changes.
> >
> > This seems to me to make things more complicated than needed, purely 
> > to address a 100 column limit. I personally don't like the change. 
> >
> > Nothing wrong with the code, and if more experienced maintainers prefer it, I'm happy to defer to them. Otherwise it seems to me noise for the sake of noise I'm afraid
> >
> > Mark
> 
> An alternative could be to set this a constant pwd_admin to
> tlmi_priv.pwd_admin. There are 13 other references to
> tlmi_priv.pwd_admin in one function alone, so maybe it might be a more
> meaningful improvement?

Hi,

The general theme in this driver seems to be that tlmi_priv.pwd_admin 
usually causes long lines so introducing a local variable for it in such 
functions would certainly help.

This probably came to be when pwd_admin was migrated over into tlmi_priv 
which certainly was correct place for it, but case with the cost of adding 
into the line lengths.

> Then again, the question arises why we aren't following the same pattern
> for all the other heavily used fields under tlmi_priv. Adding more
> constants seems to be wrong way forward.

Locally it might make sense on case by case basis, to me it looks 
business as usual to store things into function local vars to control 
deref line lengths.

> Another option would be to move repeated functionality into other
> functions (all the column limit violations seem to be identical and
> involve encoding_options and kasprintf in the same way), but a refactor
> of this nature seemed *way* beyond the scope of a simple code syle clean
> up.
> 
> Thus, assigning the required value to a small constant seemed to be the
> best immediate solution. I can see why you feel it adds complexity.
> Typically in a dynamic language (or even in a declare-as-you-need code
> style in C) this is a trivial change, whereas in a top-of-block style
> this does seem to add some cruft.
> 
> Perhaps we should drop this patch for now? Nevertheless, I think the
> column limit violations, long functions, and repeated lines are a sign
> that some refactoring is in order.
> 
> Thoughts?

As a general note on these changes, I'm wondering if you're planning on 
doing these checkpatch cleanups for a large number of drivers beyond those 
you've already submitted (which you likely won't be able to test for 
real)?

I'm asking this because "fixing" in-tree checkpatch errors/warnings is 
generally not considered something one should be doing without other work 
on the particular drivers (which normally implies proper testing beyond 
compiling). Checkpatch has its uses, but this is not one of them.

-- 
 i.

