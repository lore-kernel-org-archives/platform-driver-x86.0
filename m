Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2627F46D2A6;
	Tue, 21 Jul 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651282; cv=none; b=sJr/e38WoZWHtaVieBxl2tOxfd9Nr+fTK22yHGWKnc2CLxmOUJoVNYA46jTdEOaRjzsB8CoXgP+KugVEfguDjyCZK7R882f9sBB1GDddTp/z05EknnfNl5A9vzrAQOKsdeB10VnZ9lDr9bIFkzvNSI/W9QBQh+Wo2Q7SOaDcwMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651282; c=relaxed/simple;
	bh=psa1kH6hqROH8ZZEHqCoZMbR7t5X3AQv9vPutKDgSdU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OJxqByfP3hztlu+/KQFBgoIlzfpnfV7VvlwBSjPI6ERQcMdJNQGKPVQ4tiwbpoqdCosbdB7D4wFwxEaUuxJ/NgwzbhkBOGQTJmWNBjAZNcaDUfVVGUvKwLoxfyM7DL6qwVH3J58XxAYavR/lAf2XpcjW14NFiZdnZxrbOl2blwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbgmLmlH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbgmLmlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784651282; x=1816187282;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=psa1kH6hqROH8ZZEHqCoZMbR7t5X3AQv9vPutKDgSdU=;
  b=VbgmLmlHsvuCGqws8e9Fr9bq37j09Yn994hQfx7oc6zEZFXBbxdyZI9i
   zAEM8OsdaFIon1l5r4EDF1TglXW2areTXol5mAfearMM6pBv2bjUHc3AZ
   eAtia0Mq0ZCNgr70ZCKl8n/EDw4iG0KelyDgW7vuxXAAnzAp7t4N9EO59
   CpMPtUNyrDWPXuCweSul9inab1EeE/k3ObyHpzOc/iLWepbNLg1ZHhu1b
   KOBO98KIQDw2JjbD9rOFqZ7ZTQRCqXYCkoIIlnfd7k8QmXfmFkXCDE4Yv
   Uev9meehzNSaEZ1nVzKYZGdZy8p+lZUdp4JnebdVofDktKucQSY8wAcZD
   Q==;
X-CSE-ConnectionGUID: siWyP0c5RvCurVyoKQPH2A==
X-CSE-MsgGUID: NOPyI+dySMOZoX7DH5C+6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85460203"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85460203"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:28:01 -0700
X-CSE-ConnectionGUID: 24nPBRw/RvC48Haqmrw7ow==
X-CSE-MsgGUID: Rs7ia1VTTmSpiD7SA/uouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="261591024"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 09:27:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 19:27:54 +0300 (EEST)
To: Dave Carey <carvsdriver@gmail.com>
cc: platform-driver-x86@vger.kernel.org, W_Armin@gmx.de, 
    johannes.goede@oss.qualcomm.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard
 dock detection driver
In-Reply-To: <20260713143132.381808-3-carvsdriver@gmail.com>
Message-ID: <bd2f2f4b-9cc8-b2db-799c-4616b7ce3513@linux.intel.com>
References: <20260713143132.381808-1-carvsdriver@gmail.com> <20260713143132.381808-3-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Jul 2026, Dave Carey wrote:

> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboard
> that magnetically attaches to the bottom (secondary) screen in one of two
> positions.  The Embedded Controller tracks the attachment state in a 2-bit
> field called BKBD and signals changes via WMI event GUID
> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
> device, _UID "GMZN").
> 
> The device contains embedded BMOF data (WQDD, 20705 bytes) documenting
> both WMI interfaces used by this driver:
> 
>    LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
>    The ACPI _WED(0xEB) method returns EC.BKBD directly as an integer,
>    so the notify callback receives BKBD without a separate query.
> 
>    LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
>    8-byte buffer {uint32 IDs=0x00060000, uint32 Status=BKBD}.
>    Used for the initial state read on probe and after resume.
> 
> BKBD encoding:
>    0 = keyboard detached
>    1 = keyboard docked on top half of bottom screen
>    2 = keyboard docked on bottom half of bottom screen
>    3 = reserved (not observed in practice)
> 
> This driver registers two WMI drivers sharing a module-level
> BLOCKING_NOTIFIER_HEAD:
> 
>    - The event driver (LENOVO_BTKBD_EVENT) uses .notify_new() to receive
>      a pre-parsed wmi_buffer and fires the notifier chain with the BKBD
>      value extracted from the buffer.
> 
>    - The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_dev in
>      its per-device private struct.  At probe time it registers a
>      notifier_block on the chain and reads the initial BKBD state via
>      wmidev_query_block().  The WMI buffer is parsed as
>      struct lenovo_feature_status { __le32 id; __le32 status; }, and the
>      ID field is verified before the status is used.
> 
>    - SW_TABLET_MODE=1 is reported when the keyboard is detached;
>      SW_TABLET_MODE=0 when docked in either position (keyboard present).
> 
>    - The raw BKBD value is exposed via read-only sysfs attribute
>      "keyboard_position".
> 
>    - BKBD state is re-read via wmidev_query_block() on resume from
>      suspend or hibernation.
> 
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
> 
> Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>

Hi Dave,

Unfortunately this patch is somehow corrupted and I couldn't immediately 
figure out where so you need to fix the problem and send the series again. 

It may be worthwhile to send it yourself first and test you can apply it 
with git am yourself to make sure nothing in the way you send an email is 
causing the corruption. Once it works for you, it will likely work in my 
end as well.

--
 i.

