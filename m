Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0973320CD3;
	Tue,  7 Apr 2026 23:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775606286; cv=none; b=FWMCmaBynJyPved5WYNBV48hVXEWygGbCGPnPjUJZjE6DkRO9TMLe+RxAsFtqSeimzOXBlHX0bert6wWWHlgZzAXDuVRX42nI+u+wX9AE8D0Pak4XAF3ExyUd+vGADlYtF4A9UXS7lf9+D1v1L4OUvQnj759SR01QRyan5e+h5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775606286; c=relaxed/simple;
	bh=42wIj+NYABEAibaIh55f14ICxGnqPqeIyzIFN2g+Syo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r8yeZU+ssvp2bhZ1q+AxxwKeL5KLb4FXxNRbwvAY4bVg9UjBaOSwYobRWIYBee70TSd0pvmDfo9WAPcQ+i2i2qfOU5bM7fIoCRVm61R40zR9IcZkcOpG5pwxvRvqLiFOu/U3qtRiAXCs5gGmBjzVufAe1oxQqV0M/kvakOOxseE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=E6JBcovg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rfQBDQt3; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="E6JBcovg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rfQBDQt3"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id CE178EC0101;
	Tue,  7 Apr 2026 19:58:02 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 07 Apr 2026 19:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775606282;
	 x=1775692682; bh=tYeEmew5tjMkZ2uJxbjHO64pVe1IQUXZlC8jSOR0U2A=; b=
	E6JBcovgBphqRjpNpLPrBPejUWOqekSiJ5WglQD3ASC2B5+xziQf2j9sszrqbixd
	VIGS6nch8NBbsDm9oOeqDXVEWeAEgoYUwKqMGqKDCrdPW1ZBbrUU/icKjK5vR6fY
	dlPa10tjXoKL06OVDk6OE0gYD5CWLtlep8CE0rRXVEkW9BE+6qWIgN4NdOGMP/LV
	lq1bYguUpAmexeTu39W8TBUBlwir+RVdzVGSApM5GzdsHwuQEV9PUGm6AKrVCasc
	tXKGC/IRdy76H4KUyhcxh5orMOYbEywRP0uCuizpd1qrqqPlpnntZMf8cJW7DLNJ
	0beDZPava0sJRo0uDVKDUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775606282; x=
	1775692682; bh=tYeEmew5tjMkZ2uJxbjHO64pVe1IQUXZlC8jSOR0U2A=; b=r
	fQBDQt3eaWM/f/IEcu2ir7okgIw0xwFtdQusoAmFsIQHHpagOmh7Z4CPMjEUiMQ2
	otrjTtH8jO5o/CgU7rXPz1BOIqxUuhCUuEVtAAtBIHXpgtK62hxIevPHwjiF9sBs
	BwMVAZ+BKaZZpBoV2Ldz3c8q9be49z5nu4xEzLXd174T6BvJXz+3u8vhzKSNbSnm
	zGxTGiRTcouGSUIsHotqxwTR4QHTxNAvsS5GT55yvIAGaueSjLp0Uh6UCmrY+LUh
	JWAiLYbb/nsg3RB/dp3TTGi2yE/zAqG/od8YHUk76uUZkRUCoFgBGhoRATxxJDnR
	oUTXJ5uzTY3sBRmHsWboA==
X-ME-Sender: <xms:CprVaQDbnToT1PFFcDgG0EJdA1sOJ34ioDx50JWf4YvgJvEbhtk4Qg>
    <xme:CprVadUSh4cj2OQqDuHQ9AgW5QiH3G009Ue7TddG3BtgljOKl7bAdtLFP7hpRE4lY
    _ipA889Fg6G-80rmFgXN15tB0bjZjJT7vjHoBsZLfUWPouMjrihyCiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvvddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnheptdffvefgtefhveetuddvfeelveektdduvdelgfehgfei
    keffjeetjeevffektdfhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepkhhuuhhrthgssehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthho
    pehisehrohhnghdrmhhovgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghr
    qdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:CprVaXh6XB6cVVHeISNXYgEtncNWogNBNJ1G2PIBInW5Wno_f_KkIA>
    <xmx:CprVaQnc03F59EqWeVarmxZ5-8RRjMyO6Wf8pOBUI11Mv9P-Hf0WfA>
    <xmx:CprVabj-1ugZui_Q8IXGh1aotv7qdFcxeAI6Yb3PzqOFpYRSPNLbuQ>
    <xmx:CprVabHFeN4keo2za2iV2XskRMFfA0FpHKk9lhn5DzeOnIbwfLm7aw>
    <xmx:CprVaanSRFqKecyI8xnQyU7g4T_Bu_y0U1ysEvbPkBRonzB-0zeDphMO>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 013882CE3F94; Tue,  7 Apr 2026 19:58:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A9K85oN4Krrg
Date: Tue, 07 Apr 2026 19:57:41 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <348061ca-241f-4810-bc3c-8e85d40d8731@app.fastmail.com>
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v8 00/16] platform-x86: lenovo-wmi: Add fixes and enhancement
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 6, 2026, at 4:13 PM, Derek J. Clark wrote:
> This series adds many much needed fixes and features to the lenovo-wmi
> drivers. This version has been re-ordered to ensure the simplest
> application to the stable tree, with all fixes being pushed up front.
> This has caused some churn in the latter half of the series where I'm
> immediately changing things that were just added, but this should ensure
> a better result for all kernel versions so I'm happy with it.
>
> Patches 1-7 fix various bugs in the existing drivers and are Cc'd to
> stable.
>
> Patch 8 moves all gamezone enums from the gamezone header into the
> helpers header in preparation for the rest of the series.
>
> Patch 9 moves LWMI_FAN_DIV to be next to the rest of the fan attribute
> defines in preparation for adding additional attrbiute macros. This is
> so the attribute macros can all be in the same place in the file.
>
> Patch 10 adds a function to make assigning attribute ID's for capdata
> cleaner and easier.
>
> Patch 11 adds the remaining CPU attributes that weren't previously
> exposed.
>
> Patch 12 adds GPU attributes.
>
> Patch 13 renames a name constant in preparation for patch 6.
>
> Patch 14 adds battery charge-type limiting when supported only by WMI, or
> when a module parameter to skip compatibility checks is set. The
> MODULE_PARM_DESC macro creates one check and two warnings in checkpatch.
> I reviewed other examples from the kernel and I am following the same
> convention, so I left it as is.
>
> Patch 15 adds a debugfs directory.
>
> Patch 16 adds a debugfs file for dumping capdata.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v8:
>   - Clean up rebase mixup with re-assinment of wmi_method_args_32 in
>     patches 6 and 14 from {} to { 0x00, 0x00 } and back.
>   - Combine ret_obj declaration and assignment in patch 1.
> v7: 
> https://lore.kernel.org/platform-driver-x86/20260402032424.678528-1-derekjohn.clark@gmail.com/
>   - Add 3 additional bug fix patches from Rong Zhang reported by
>     shashiko.dev
>   - Reorder patches so the fixes are upfront in patches 1-7.
>   - Fix various typos and rebase mixups from v6.
> v6: 
> https://lore.kernel.org/platform-driver-x86/20260331181208.421552-1-derekjohn.clark@gmail.com/
>   - Incorporate Rong Zhang's debugfs and decoupling patches into the
>     series.
>   - Add a patch to clean up too many cross-references to wmi-gamezone.h
>   - Make lwmi_attr_id a static inline in wmi-capdata.h
>   - Added a patch  to fix a bug where ares.arg1 is uninitialized when it
>     is sent to the firmware.
>   - Add supported checks before adding battery extenstion, and ensure
>     both the new checks and the is_writable checks are not casting u32
>     to i32.
>   - Misc formating changes.
> v5: 
> https://lore.kernel.org/platform-driver-x86/20260324221032.1333636-1-derekjohn.clark@gmail.com/
>   - Remove cv/cd_mode_id references that occured before patch 4.
>   - Move lwmi_attr_id to capdata.c with a namespace export.
>   - Fix mixing include.
>   - Make lwmi_attr_is_supported return bool.
>   - Use switch instead of if for setting/getting charge type state.
>   - Various formatting fixes.
> v4: 
> https://lore.kernel.org/platform-driver-x86/20260312031032.3467565-1-derekjohn.clark@gmail.com/
>   - Use loop instead of back gotos for identifying the working attribute
>     ID.
>   - Use function instead of macro to assign attribute_id, preserving
>     types.
>   - Removed unused defines and enum values.
>   - Rename charging defines to clarify thier purpose.
>   - Fixed various formatting issues from v3.
>   - Added module param to skip ACPI check when loading the driver for
>     the power supply extension.
>   - Don't abort adding power supply extension if the ACPI handle from
>     ideapad is not present.
>   - Don't worry about symmetric cleanup when cleaning up attributes in
>     an error state.
>   - Reword Patch 8 commit message to be more concise.
>   - Fix wording in Patch 7 to match the changes.
> v3: 
> https://lore.kernel.org/platform-driver-x86/20260224043200.2680384-1-derekjohn.clark@gmail.com/
>   - Re-add HWMON name const and just rename LWMI_OM_FW_ATTR_BASE_PATH
>   - Fix linker warnings by moving acpi/battery include to the end of the
>     list.
>   - Remove CPU/GPU OC features. These attributes are BOOL type and will
>     need a new constructor that I'll add later.
> v2: 
> https://lore.kernel.org/platform-driver-x86/20260215061339.2842486-1-derekjohn.clark@gmail.com/
>   - Fix gpu_mode misisng from attributes list.
>   - Fix prototypes for power suppy patch.
>   - Reorganize CPU and GPU attributes alphabetically.
>   - Break out the patch consolidating the driver name cost.
>   - Move some of the refactoring of attribute_id back to into patch 1
>     where it belongs.
>   - Fix some additional typos in function prototypes.
> v1: 
> https://lore.kernel.org/platform-driver-x86/20260213081243.794288-1-derekjohn.clark@gmail.com/
>
> Derek J. Clark (10):
>   platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
>   platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
>   platform/x86: lenovo-wmi-other: Limit adding attributes to supported
>     devices
>   platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
>   platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
>   platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
>   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
>   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
>   platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
>   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
>
> Rong Zhang (6):
>   platform/x86: lenovo-wmi-helpers: Fix memory leak in
>     lwmi_dev_evaluate_int()
>   platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
>   platform/x86: lenovo-wmi-other: Balance component bind and unbind
>   platform/x86: lenovo: Decouple lenovo-wmi-gamezone and
>     lenovo-wmi-other
>   platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
>     debugfs dir
>   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
>
>  .../wmi/devices/lenovo-wmi-other.rst          |  19 +
>  drivers/platform/x86/lenovo/Kconfig           |   3 +-
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 128 ++-
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  31 +-
>  drivers/platform/x86/lenovo/wmi-events.c      |   2 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.c    |   7 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.h    |  20 -
>  drivers/platform/x86/lenovo/wmi-helpers.c     | 138 +++-
>  drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 745 ++++++++++++++----
>  drivers/platform/x86/lenovo/wmi-other.h       |  16 -
>  11 files changed, 934 insertions(+), 198 deletions(-)
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h
>
> -- 
> 2.53.0

Now I've been over it all, for the full series:
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

