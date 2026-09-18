Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013351EDF4;
	Fri, 18 Sep 2026 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756026; cv=none; b=sQ/qcPAqHmjDXMVecEmZZm46L2Rsvdmh87UAn+G4MX0txZcSG+RDsVJXCAfFXkvpexX5szilE6m5tBgKkUN+A+8FOX4S9tIHSnl3VmFbjCapEn61ONPJHanO5agN1H8pIx6ZnqwhnDFFibhceOzSkOxI+38hlrkoz6WpSiFBiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756026; c=relaxed/simple;
	bh=nT+G1uzGkU7uFKTyyVKkOeS9vHWEtL8Gc5zs9L3NNtQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nzOlb1t8CD3dcPtIU5MYtyWVSXpIk6obJkegwsnubed+PI+zHLhHKriVeDHEo23D+VKghw5QdZWLsG7+/UwFjkXe3cAqxqRScuAoQdDifTlJTvxgcnL2NO7sKbYrkufSP4DMRG3SkDgepvxgTEoUzmjqh4nGCJhP9m3OmKMMtHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9mJ8SkK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9mJ8SkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756025; x=1821292025;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nT+G1uzGkU7uFKTyyVKkOeS9vHWEtL8Gc5zs9L3NNtQ=;
  b=N9mJ8SkKPEZxeSXOcZEAVfCRR8S+7bhPgZUajBqb+PZK+xJ/XvirGSu4
   cKXElcsL6WuMrnEoXslS1TZLyKJSK1G7U8yFE8Z3M2mqR9xrSNYWFfAh7
   Q+FFwk7JqplQhSa6I4fugPZ7Jz9Mt+VJ3DKMG/k/ZtygaH12InIBYVf2l
   tGB0EEknfQbLEatvdUNAuE645+jofi6dL0CNmyL16Yx/wFsbN0auhfLci
   MkTPqW4vHpPoFw6GhYwIf0umksK/4ZPPo/N3UE3lCvN1dl8y/CwGHuxF+
   EK8QZ3FmNgQBuAq4xbszZ5z49Zg5w2FF5SCOvlu3uxoTCgcHwxKYJZrii
   g==;
X-CSE-ConnectionGUID: DqPRWVQzRRenUBKQd8aDJQ==
X-CSE-MsgGUID: VPzmshMkTTOtmYvPS4rFpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100881128"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100881128"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:04 -0700
X-CSE-ConnectionGUID: ZTK1Q7fdQIe+xM4jH7pp3Q==
X-CSE-MsgGUID: ennjZRJrQzO9AMAJCVE3CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="276499464"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Daniel Salmun <salmundani@gmail.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915021154.23252-1-salmundani@gmail.com>
References: <20260915021154.23252-1-salmundani@gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix fan speed
 reporting on ThinkPad L440
Message-Id: <178975601696.29716.18223114124719995944.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:26:56 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 14 Sep 2026 23:11:54 -0300, Daniel Salmun wrote:

> The L440 (BIOS J4ET93WW) reports its fan as stopped: /proc/acpi/ibm/fan
> shows "status: disabled" and "speed: 0", and hwmon fan1_input is 0 under
> any load. EC registers 0x2F and 0x84/0x85 always read 0 on this model.
> 
> The EC uses the 0x93/0x95 layout handled by TPACPI_FAN_NS. 0x93 reads 4
> (FAN_NS_CTRL_STATUS) and 0x95 goes from 255 at idle to about 111 at full
> speed. The DSDT has no fan methods.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Fix fan speed reporting on ThinkPad L440
      commit: 5b16d186082465a5938bff29fe50df144e4efc99

--
 i.

