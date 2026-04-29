Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEDD13FEE;
	Wed, 29 Apr 2026 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777427964; cv=none; b=WEops4hf5wHA/OOUPeOMWZ3XZMyTFhxFpTnBN8IjcNIjQBkEldExEW4pdgNx71yH9FiqkX5KDfcCOAzIYfTGF9QZgJ6grhPqNyB3WgBgokWtSCDJsfW6hLxb4y7tiMVi3dxcCQkEJmTV6zCSftulz/syx5xNeU9aVcgUPEt/AFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777427964; c=relaxed/simple;
	bh=ucGQLYUOQh/q6t51G8jl/mpCr+TAPa5nOqt4QnIY/kI=;
	h=MIME-Version:Date:From:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PANJ1KsWJGwZWjNOHzGQ04ZZlVijTAV/jlGgBkaDE39V1FUROBFOXFs8g6j7v6K2dTuvqoUM6wDZvyDDsq1TwHDLRCj2thahYqan8K3r8dm8zKgnuU7O9hTYrbChaszo0n5hcHkC1o+GB8fv379T03tLXAGV0s0ldcmq8M74s+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=iPXCNA9a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WJN19Au/; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="iPXCNA9a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WJN19Au/"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 7E7E5EC012C;
	Tue, 28 Apr 2026 21:59:21 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 28 Apr 2026 21:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to; s=fm3; t=1777427961; x=
	1777514361; bh=YW9+g70FwBo7R0hbd2G+RZzb4bUDYKSn7QykYcYYEvQ=; b=i
	PXCNA9afRFPs9G+8a4GMehzKxJaIJ3q8Q+NIAO9Sh2Ffj9ZxaZdV1Uk+EUzSNcQ+
	c0g0SRE3ARBVl9iskvs4LxuFu85g4LBWckYw6Nv3I6Fy2oN6YaBuTK0JO/6O4ETG
	2W3Le3qo+040WTBttCo3sm6TgigV8kqSmHzF9jWSRtcpNcLhFeJCYc617PY2eI14
	Fgs+GzhwxNY+iHm29/D5TacWZOogQlv5HIEVf56FLL/BC01nA+uTeULgaPrzyCkT
	aqqDaY2NpQFn0twrWA5HEkjHhxg/jX5kuJjDPUlv5b1Nqg+QBhRrqb09GqJzQc1k
	7WDEMKyprQtfL1uq0o7iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1777427961; x=1777514361; bh=Y
	W9+g70FwBo7R0hbd2G+RZzb4bUDYKSn7QykYcYYEvQ=; b=WJN19Au/Qcry78CW3
	fXod+cfn7+n57+4xVDnk+ZC57TnBSO5NXUVhCFszXC0dy0Jwt9jN5K8PuPz0OmpJ
	jDzN+WzEcEFi6Uc4CB/VHDGyqYf4BtG/FEDSdN6rplRmLsgARU9bFikqXlNbH/LP
	Fq85mYg6tKNQxYe4MNUf8PYsWeDCX38EL9Qg5jSERIu/cMcFAy+tGwGA540TrSDH
	ZG7Hbxd7IGG2z2evmGokqOB+fhxew1upFo+JnvNp1NdaR2SMvI8kBZgDxAP/pTn0
	cWi4n+Eq263Ix3S9vCpUb/jdRwlr4mEmyk2fqQC+LS/GBtm16hE3M5PzF89sA6zY
	VxeHw==
X-ME-Sender: <xms:-WXxaTdrXLzDwaBuygj6-pfFKKuXVCUKg4cCHBpON7j46-JYQ6L0lg>
    <xme:-WXxaUDk758Od9apOLiteR3mdbVcDZQYmhyA6v1XC_xArl7NKp4TyO3hH3YRvCXq5
    IDOIWPEbE7JTGpkuHVYLP_CKgaliNvla8ACu8lQeURqMKpYHJ2odw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfedukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenmhhish
    hsihhnghcuvffquchfihgvlhguucdlfedtmdenucfjughrpefoggffhfevkfgjfhfutgfg
    sehtjeertdertddtnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrg
    hrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpedv
    keefueefvddvfeevudejffeugfelvddugeegteetudefhedtveejffelteelueenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshho
    nhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeehpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpd
    hrtghpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghf
    ohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiek
    ieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-WXxaVL3dWpuToBgpga14yd9TBKVgO0cLHIqMlpqJ-eaktdXw6u1Ng>
    <xmx:-WXxaadp80_gJ1OmY2-SPxYktd_LiOYaVi1ttxISXRkLc7dLi4NJMQ>
    <xmx:-WXxaU_V-VnJ3yV0urMYkkGXz4UbswhsDUn78OcEOKBoqUyGanuMJw>
    <xmx:-WXxaXrrCHv_4OtAGPJelhZ5xrtCBNpyjEwGGdiz7VaBn-CQtxoygQ>
    <xmx:-WXxaSUIhA34aS6aNoCHwrtutZiW5GapBOGYEBkUttp95u0yflSRkQy7>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4DA0D2CE0072; Tue, 28 Apr 2026 21:59:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AsfoP7IDzlRF
Date: Tue, 28 Apr 2026 21:59:00 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <4caef44a-3ae1-4f5e-9198-24284f936353@app.fastmail.com>
In-Reply-To: <20260429015210.1863316-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20260429015210.1863316-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add debugfs entry to display HWDD
 raw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 28, 2026, at 9:51 PM, Mark Pearson wrote:
> The Lenovo diagnostics and support team have requested a mechanism
> to get the raw data from the HWDD commands to support customer debug
> situations.
>
> Add a debugfs entry to display the HWDD raw data.
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---

Apologies - in doing a minor final clean up I missed adding the changes to the entry notes :(
Let me know if I should resend the patch - but otherwise it was:

Changes in v2: Changed from sysfs entry with module parameter to using debugfs.

>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 39 +++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index e1cee42a1683..dd3e206a1295 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -38,6 +38,7 @@
>  #include <linux/backlight.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/freezer.h>
> @@ -11217,6 +11218,26 @@ static ssize_t hwdd_status_show(struct device 
> *dev,
> 
>  	return sysfs_emit(buf, "0\n");
>  }
> +
> +/* sysfs type-c damage detection raw data - accessed via debugfs*/
> +static int hwdd_raw_show(struct seq_file *m, void *v)
> +{
> +	unsigned int damage_status;
> +	int err;
> +
> +	if (!ucdd_supported)
> +		return -ENODEV;
> +
> +	/* Get USB TYPE-C damage status */
> +	err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
> +	if (err)
> +		return err;
> +
> +	seq_printf(m, "HWDD: 0x%x\n", damage_status);
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(hwdd_raw);
> +
>  static DEVICE_ATTR_RO(hwdd_status);
>  static DEVICE_ATTR_RO(hwdd_detail);
> 
> @@ -11504,6 +11525,20 @@ static const char * __init str_supported(int 
> is_supported)
>  }
>  #endif /* CONFIG_THINKPAD_ACPI_DEBUG */
> 
> +static struct dentry *tpacpi_dbg;
> +static void tpacpi_debugfs_init(void)
> +{
> +	tpacpi_dbg = debugfs_create_dir("tpacpi", NULL);
> +
> +	/* HWDD raw data */
> +	debugfs_create_file("hwdd-raw", 0444, tpacpi_dbg, NULL, &hwdd_raw_fops);
> +}
> +
> +static void tpacpi_debugfs_remove(void)
> +{
> +	debugfs_remove_recursive(tpacpi_dbg);
> +}
> +
>  static void ibm_exit(struct ibm_struct *ibm)
>  {
>  	dbg_printk(TPACPI_DBG_EXIT, "removing %s\n", ibm->name);
> @@ -12068,6 +12103,8 @@ static void thinkpad_acpi_module_exit(void)
>  		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir);
>  	if (tpacpi_wq)
>  		destroy_workqueue(tpacpi_wq);
> +	if (tpacpi_dbg)
> +		tpacpi_debugfs_remove();
> 
>  	kfree(thinkpad_id.bios_version_str);
>  	kfree(thinkpad_id.ec_version_str);
> @@ -12198,6 +12235,8 @@ static int __init thinkpad_acpi_module_init(void)
>  		return -ENODEV;
>  	}
> 
> +	tpacpi_debugfs_init();
> +
>  	dmi_id = dmi_first_match(fwbug_list);
>  	if (dmi_id)
>  		tp_features.quirks = dmi_id->driver_data;
> -- 
> 2.43.0
