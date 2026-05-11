Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3236E493;
	Mon, 11 May 2026 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499958; cv=none; b=DdHWzIasyBBCE4TJApqjPpdZUq8c5OyuR0sPoaRMPbcR0sdAM1nHf278eOOl2iTwpRMqcYm87qx+iUYHYaUT4whC8Kq84UcKqjCfqWUII1YrQyubn6tDDWb2nvm8SRDyrb8D+ZVcztkcneoUkMxYksnqgaPx2ShPDrirNAdCpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499958; c=relaxed/simple;
	bh=//PWO9bSt6pd8D+BEVMViunOs5sYe41wKax63Q2vup4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hSTQ7tz2Fv6arNZtsCpPFw64K6axYxdbOCfymkVFRPjC+k7t67o6mpN0U1RaJkVGLmNC3z2QBZsTD+tp5MInYeDLUIx8PhW7/vaxw2lallYkZpXCqRnBQJ5DS5uR9WD4HiFlvFMYhplYBlMSBqrUQldZw3ijXCrUCfpCGSQxTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQPzkWec; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQPzkWec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778499955; x=1810035955;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=//PWO9bSt6pd8D+BEVMViunOs5sYe41wKax63Q2vup4=;
  b=mQPzkWecRK5rnRtAbnZYq+KC12a6grJ3SbsvWIpzfGsELQw5Vkx5W3G9
   SFBs3z/InIxplxMxmyqyFMNWu4Mrvq5qKoj3sY1x5XIiwqbuG6dfFe16T
   BHXH9M1z6J3a869ASg/fdJtP7X/6JsMtDoseHgAx4K0n6ULmiwdJcu0cL
   XSv2CY/ja3b4ThiT/9kTdYznVMaXwmdEjY6xLYKMiiJ5tzJG6NV4AR47B
   +IfewVcFpPW5zjHb2HZrrnV1/afHgUjk+0JwqWBrirDAackATdD0DQbyt
   Fj8uNq9QvSXGtZ1OU8wbXLx8ShzZLi+cQd4xW6LBNLreJD8tcpY6KVjYW
   w==;
X-CSE-ConnectionGUID: CxTEHMhySSG5kNqSPcoA9Q==
X-CSE-MsgGUID: dp08DTLNTeyprYlzXLdf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79246188"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79246188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:45:54 -0700
X-CSE-ConnectionGUID: QgF1HBKAT4yD6CJZG60/PQ==
X-CSE-MsgGUID: JFbduY3AQLCS2d7O+vLmrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234374905"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 04:45:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 14:45:46 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    =?ISO-8859-15?Q?N=EDcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
    marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 00/16] lenovo-wmi: Add fixes and enhancement
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
Message-ID: <ef1b3296-aec4-56ed-4f93-13ac37515c63@linux.intel.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 May 2026, Derek J. Clark wrote:

> This series adds many much needed fixes and features to the lenovo-wmi*
> drivers. This version has been re-ordered to ensure the least amount of
> churn in each patch. This has resulted in two formatting patches being
> added to the stable Cc list as prerequisites for some of the fixes.
> 
> Patches 1-9 fix various bugs and formatting, and are Cc'd to stable.

Thanks for the update.

I've taken 1-9 into review-ilpo-fixes branch and will do fixes -> 
for-next merge later to be able to pick up rest of the patches there.

-- 
 i.


> for the formatting only ones, patch 7 moves all gamezone enums from the
> gamezone header into the helpers header and patch 8 adds two functions
> to make assigning attribute ID's for capdata0X and tunable_attr_01
> cleaner.
> 
> Patch 10 adds the remaining CPU attributes that weren't previously
> exposed.
> 
> Patch 11 adds GPU attributes.
> 
> Patch 12 renames a name constant in preparation for patch 6.
> 
> Patch 13 adds battery charge-type limiting when supported only by WMI, or
> when a module parameter to skip compatibility checks is set. The
> MODULE_PARM_DESC macro creates one check and two warnings in checkpatch.
> I reviewed other examples from the kernel and I am following the same
> convention, so I left it as is.
> 
> Patch 14 adds a module parameter, force_load_psy_ext, to bypass ACPI and
> BIOS compatibility checks for the power supply extension.
> 
> Patch 15 adds a debugfs directory.
> 
> Patch 16 adds a debugfs file for dumping capdata.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v12:
>   - Break out force_load_psy_ext into its own patch.
>   - Drop fixes tags for formatting only prerequisite patches Cc'd to
>     stable.
>   - Fix formatting in various places.
>   - Use correct type when passing args in new functions. I will revisit
>     & fix older functions in a new series.
> v11: https://lore.kernel.org/platform-driver-x86/20260507180507.912966-1-derekjohn.clark@gmail.com/
>   - Reorganize patches in a way that cleans up the churn with
>     assignment of attribute IDs. This also allowed dropping the
>     patch that moved the LWMI_FAN_DIV patch as it is now effectively
>     moved when declaring the updated LWMI_ATTR_ID_FAN_DIV macro. As a
>     result, some formatting only patches were added to the Cc list for
>     stable since as they are now prerequisites to some of the fixes.
>   - Refactor charge control patch to use charge_behavior and
>     charge_control_end_threshold instead of charge_types to be in
>     accordance with the power supply class documentation.
>   - Minor additional formatting fixes.
> v10: https://lore.kernel.org/platform-driver-x86/20260411162334.25682-1-derekjohn.clark@gmail.com/
>   - Fix misnamed attribute in wmi-other.
> v9: https://lore.kernel.org/platform-driver-x86/20260411162334.25682-1-derekjohn.clark@gmail.com/
>   - Invert ida_alloc fail logic.
>   - Fix dropped mode arg in current_value_show.
>   - Fix misnamed attribute in documentation.
> v8: https://lore.kernel.org/platform-driver-x86/20260406201400.438221-1-derekjohn.clark@gmail.com/
>   - Clean up rebase mixup with re-assinment of wmi_method_args_32 in
>     patches 6 and 14 from {} to { 0x00, 0x00 } and back.
>   - Combine ret_obj declaration and assignment in patch 1.
> v7: https://lore.kernel.org/platform-driver-x86/20260402032424.678528-1-derekjohn.clark@gmail.com/
>   - Add 3 additional bug fix patches from Rong Zhang reported by
>     shashiko.dev
>   - Reorder patches so the fixes are upfront in patches 1-7.
>   - Fix various typos and rebase mixups from v6.
> v6: https://lore.kernel.org/platform-driver-x86/20260331181208.421552-1-derekjohn.clark@gmail.com/
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
> v5: https://lore.kernel.org/platform-driver-x86/20260324221032.1333636-1-derekjohn.clark@gmail.com/
>   - Remove cv/cd_mode_id references that occured before patch 4.
>   - Move lwmi_attr_id to capdata.c with a namespace export.
>   - Fix mixing include.
>   - Make lwmi_attr_is_supported return bool.
>   - Use switch instead of if for setting/getting charge type state.
>   - Various formatting fixes.
> v4: https://lore.kernel.org/platform-driver-x86/20260312031032.3467565-1-derekjohn.clark@gmail.com/
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
> v3: https://lore.kernel.org/platform-driver-x86/20260224043200.2680384-1-derekjohn.clark@gmail.com/
>   - Re-add HWMON name const and just rename LWMI_OM_FW_ATTR_BASE_PATH
>   - Fix linker warnings by moving acpi/battery include to the end of the
>     list.
>   - Remove CPU/GPU OC features. These attributes are BOOL type and will
>     need a new constructor that I'll add later.
> v2: https://lore.kernel.org/platform-driver-x86/20260215061339.2842486-1-derekjohn.clark@gmail.com/
>   - Fix gpu_mode misisng from attributes list.
>   - Fix prototypes for power suppy patch.
>   - Reorganize CPU and GPU attributes alphabetically.
>   - Break out the patch consolidating the driver name cost.
>   - Move some of the refactoring of attribute_id back to into patch 1
>     where it belongs.
>   - Fix some additional typos in function prototypes.
> v1: https://lore.kernel.org/platform-driver-x86/20260213081243.794288-1-derekjohn.clark@gmail.com/
> 
> Derek J. Clark (10):
>   platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
>   platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
>   platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
>   platform/x86: lenovo-wmi-other: Add Attribute ID helper functions
>   platform/x86: lenovo-wmi-other: Limit adding attributes to supported
>     devices
>   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
>   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
>   platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
>   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
>   platform/x86: lenovo-wmi-other: Add force_load_psy_ext module
>     parameter
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
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  34 +-
>  drivers/platform/x86/lenovo/wmi-events.c      |   2 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.c    |   7 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.h    |  20 -
>  drivers/platform/x86/lenovo/wmi-helpers.c     | 139 ++-
>  drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 867 +++++++++++++++---
>  drivers/platform/x86/lenovo/wmi-other.h       |  16 -
>  11 files changed, 1061 insertions(+), 197 deletions(-)
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h
> 
> 
