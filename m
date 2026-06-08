Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB5A285CAD;
	Mon,  8 Jun 2026 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923056; cv=none; b=MYj9mid6ju5pynOliUwf6D/jBUS81m4wRx2VAx11kVty5EI8Sh7ZsFXMGCLAacjtGJiNhArwcAPWz7TtVaWtvFe2D7XOOqQm7HfWpdPx98GsLCFJxAFRGR6QDTBD+kbsSWrnYRCPD8fECbTb5PDDKUSP/BCszmyiIekqbmPzu84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923056; c=relaxed/simple;
	bh=+Tx9oXr/999wv93QJaExOS0yLpNWoIh6zKMnVI+fVno=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R8xn6IL0SZ6fHwaWI2Avfxh4t1vjzcJKcjqdXnrz96B2Y3GLwnAFDMvqkhkYj/4QxZ7TS8tR3t6O2RhUuhcZCxS3xWeVB+SoKXS5Zj4bmqSsEcTNvAbY+VqM5F3XDwWRdPJ2iwgdnvuU2UN3YQN5R0LKvfVQJz0D8U7jXWmmoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFdSuPHI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFdSuPHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780923055; x=1812459055;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+Tx9oXr/999wv93QJaExOS0yLpNWoIh6zKMnVI+fVno=;
  b=RFdSuPHIaMy5HyDYYggiDXVNcyn3pU2SGa7h6ZTshF2WZ7Hkgb1BEpYV
   0gm3KmL0+8OxvxzEPCANlf3B5Z99zxDeFUSJ3gqqZP6IQn5XoctVojLU+
   hWVRo22l1eNSPMiFwp+cKvaYvhx6zMceeq2fK/yBhFUYW8iILx2mKku5+
   HlpmUPPJWbkA+GNmOcLi7yXrGVwQPDcBJlpYlUuG/yVX3vXfuNtDtFv8+
   P5y6PJ1UzoMo4s4kKjjxZ3vFzufH9mJ8YbDoRJfc/TECDcUKNUXXEC0Lv
   u9nfvuptjVafTZXxB70SzKNJHpU0t/ab8wKrtY5zP9Rh8dPK3Ubs1z553
   A==;
X-CSE-ConnectionGUID: vQLKYCCsSXeR4X117HANSQ==
X-CSE-MsgGUID: y5ei4g2lSn+XJXOajx5rAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80683784"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="80683784"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 05:50:54 -0700
X-CSE-ConnectionGUID: 7VEqRnF1SW2EjYcJeqKlsw==
X-CSE-MsgGUID: s9hfUJbBTO6hqBsaUkGVbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="243098605"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 05:50:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 15:50:48 +0300 (EEST)
To: Nikolay Metchev <nikolaymetchev@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: intel-hid: Add HP ProBook x360 440 G1 to
 button_array_table
In-Reply-To: <CAMPeJfpKCV=cbxbMJen3FFfJ1J9Q7i4Wup4AZJLP4PvScmNYzg@mail.gmail.com>
Message-ID: <6f0e5451-0ce5-d4c2-8ade-3489701c9df6@linux.intel.com>
References: <CAMPeJfpKCV=cbxbMJen3FFfJ1J9Q7i4Wup4AZJLP4PvScmNYzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Jun 2026, Nikolay Metchev wrote:

> The HP ProBook x360 440 G1 convertible sends
>  5-button-array event codes
>  (0xc4/0xc5 volume-up, 0xc6/0xc7 volume-down for the
>  side volume rocker)
>  to the intel-hid ACPI device (INT33D5), but it does
>  not advertise the
>  array through the HEBC capability method. As a result
>  button_array_present() returns false, the "Intel HID
>  5 button array"
>  input device is never created, and the rocker events
>  are dropped in
>  notify_handler() with "intel-hid INT33D5:00: unknown
>  event 0xc4".
> 
>  Add the machine to button_array_table so the 5 button
>  array input
>  device is set up, which makes the side volume rocker
>  emit
>  KEY_VOLUMEUP / KEY_VOLUMEDOWN as expected.
> 
>  Tested on an HP ProBook x360 440 G1: with
>  enable_5_button_array=1
>  (same code path as this quirk) the kernel logs
>  "platform supports 5
>  button array" and the rocker generates native
>  KEY_VOLUMEUP /
>  KEY_VOLUMEDOWN events.
> 
>  Signed-off-by: Nikolay Metchev
>  <nikolaymetchev@gmail.com>

Please send the patch inline, not as an attachment.

-- 
 i.

