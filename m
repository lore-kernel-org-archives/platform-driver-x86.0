Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A175A175AD
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714385195; cv=none; b=VN8g6ceC2FDcz7Q5sNDmdu4rQaA9SLM6z9Al8cPcKY74HRIwfYN/YYGPJlIS/k0c/DttjpxVDEUDI+S/JATO6tTJSBLBTzubBINOktkcf9UxR+ua2AOvncLNBzTw7cjl/kWQzL9UyOsKFk/8Rvo9QRIXvLUpoiE2w7YhrHeL+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714385195; c=relaxed/simple;
	bh=JY8KcHAAy1ynnUlBkW0InCu/ze++LVyVGKFQMnvgwdU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GLKTnhTxPsQXsGahQ9MuCepUxthoKLm5it63DSBhU4hQMZLSwNyvLuSQOSQWeRmAaw9ABFWNU/imMWz4maherBE5ZHkf0toKj22fW1M8pOSKvcakhN4QKn1qWecCNCCrTOH6L82euHYmFMtbrirx/AgbO3E2uONsTKVP5r+OTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXY86/4j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXY86/4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714385193; x=1745921193;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=JY8KcHAAy1ynnUlBkW0InCu/ze++LVyVGKFQMnvgwdU=;
  b=cXY86/4jYi/bMTFkaYK0Esjuo33Yl9eqiedZuQ8E2zMoj0Ui4x2NgS1U
   iz7buSJ5CwYcGMErsSDymugBl0MAMUyqt5ZGIx4c6HgPmaKHOCN15oxEk
   ScbpiOD8OPJ5PWv4j65VDcaQ2hZw0OYqo/sIT74ZQ6FiGUEeLubwJflWE
   C5oI4s23sZoFwL7GpjtVxfm2TfpzozK0Wptjyh6N6/NuZqArClQQAdYPn
   qkgXOlL24jChD6/HVkHYHUo1IW5vDiZC8/ZllZmvCJ7vM7Y4nxUiH94CW
   oTPotKAwl/9v3Yw2NFSgbI5a55BNZGKr5athxNrbTl7tNnsYoQoVQQUO+
   g==;
X-CSE-ConnectionGUID: qohwESOKSaCXDQUOqJqe/A==
X-CSE-MsgGUID: 84AMUWKmRUOOaWBs/GWgpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10159547"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10159547"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:06:33 -0700
X-CSE-ConnectionGUID: M3ABj0AiS8a34S9FudXypw==
X-CSE-MsgGUID: bp28cTwGQYOCHGzSUp30NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30747434"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.45])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:06:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Apr 2024 13:06:26 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 16/24] platform/x86: thinkpad_acpi: Change
 hotkey_reserved_mask initialization
In-Reply-To: <b00d7c9c-db55-4337-84f1-fd1d19c00859@redhat.com>
Message-ID: <1fdd3f05-523e-c882-9c9c-c406ff750ca3@linux.intel.com>
References: <20240424122834.19801-1-hdegoede@redhat.com> <20240424122834.19801-17-hdegoede@redhat.com> <d56986cf-e400-4f8f-d2aa-0fb1bba297cf@linux.intel.com> <b00d7c9c-db55-4337-84f1-fd1d19c00859@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-848392664-1714385060=:1286"
Content-ID: <d14eeb24-bf8d-439d-cd48-ef0b1171a7ad@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-848392664-1714385060=:1286
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <35adacab-ba4f-cce6-2767-6b07abfc2a7c@linux.intel.com>

On Mon, 29 Apr 2024, Hans de Goede wrote:
>
> Thank you for reviewing this series.
>=20
> On 4/25/24 11:14 AM, Ilpo J=E4rvinen wrote:
> > On Wed, 24 Apr 2024, Hans de Goede wrote:
> >=20
> >> Change the hotkey_reserved_mask initialization to hardcode the list
> >> of reserved keys. There are only a few reserved keys and the code to
> >> iterate over the keymap will be removed when moving to sparse-keymaps.
> >=20
> > Hi,
> >=20
> > Consider extending this explanation. It's hard to see how the old and n=
ew=20
> > code are identical because there are more KEY_RESERVED entries in the=
=20
> > array than in the new code. I can see the list of keys in the new code=
=20
> > matches to those set using tpacpi_hotkey_driver_mask_set() but it's har=
d=20
> > to connect the dots here.
>=20
> Right, this is basically the same question as which Mark asked. I've adde=
d
> the following to the commit message while merging this series to clarify =
this:
>=20
> """
> Note only the 32 original hotkeys are affected by any of the hotkey_*_mas=
k
> values, note:
>=20
>         if (i < sizeof(hotkey_reserved_mask)*8)
>                 hotkey_reserved_mask |=3D 1 << i;
>=20
> The (i < sizeof(hotkey_reserved_mask)*8) condition translates to (i < 32)
> so this code only ever set bits in hotkey_reserved_mask for the 32 origin=
al
> hotkeys. Therefor this patch does not set any bits in hotkey_reserved_mas=
k
> for the KEY_RESERVED mappings for the adaptive keyboard scancodes.
> """

Thanks for adding it, very clear now!

--=20
 i.
--8323328-848392664-1714385060=:1286--
