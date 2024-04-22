Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165DB50279
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713773471; cv=none; b=qfkDIsZzFe0rdZf/an0c6ya5PvJ96vPPVN5Qwt9m2ThgdpRPvBtGX9JuUh9Te1Ar9poOlBsUIQ48uNx2fgB5WVzSOhck7i6HDTHxCanX3a+XYu7MH1fEnp0Mv/wVERmtJDxFE+VWe0zZ7Zs9DsSQaFoOFtKt5PW4BuKUJ+VPd1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713773471; c=relaxed/simple;
	bh=vRT6KZFE/m8FpXM365YOlVJEfnk+aIjkPRu6cKSm3NY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aUsm4cQFwRNX6Eb40gFXmNenR7jVp2aiMXkNOoz5fepDcOjqxk+nvR7+VALl4htL6ooojKuZGNg0qel6NTxWJy/v2COZHp3jdjUKmp0emM9DOWXxSQq9p1X9U6kDpxfEW5RI/JeHqf3B1AkwYGW+T+1LQs6gDalYnTAKqHNiXeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7ruGwBF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7ruGwBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713773468; x=1745309468;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vRT6KZFE/m8FpXM365YOlVJEfnk+aIjkPRu6cKSm3NY=;
  b=c7ruGwBFkBmWW/R2sTvoQJ217TkJAtGen0O/GTwCvspjDZW9oX5GYzaI
   MBkysdd+tvEVxjqaH+8qdPPzjdRikjgLex2gRbLk112/oiNpKmC2sF6Ds
   ARv5xuLgU0z8dClskEBM5bniCTUw4Mbo1eNwQJqChNZZpFzKkq/8y29cy
   ianVpsemXS8kdvjPkXievPotZvrqfz0+fPgknLYhuyr7iTF8SOA6laS1Q
   YRwX+khusl/WyVVErZQtKfFiJpvWyssT8AYxKCm6dr1BmATevqsld2WAK
   6zB8fHyw2NOD6Dws9VLN1ffHDK0OV8L+OpKcQE1AG2tIRFojc/FTcw3pD
   A==;
X-CSE-ConnectionGUID: YQkqrGMiQxG4rzq7+MpRiw==
X-CSE-MsgGUID: Dbrga+rHS1SVfhCYPmxV7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9416312"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9416312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:11:07 -0700
X-CSE-ConnectionGUID: 7Yzaa3UhSCqnzylFD4XyoA==
X-CSE-MsgGUID: ZFqH20RfTr2O52U09gUjgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="23965034"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.39])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:11:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 22 Apr 2024 11:11:00 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 05/24] platform/x86: thinkpad_acpi: Use tpacpi_input_send_key()
 in adaptive kbd code
In-Reply-To: <20240421154520.37089-6-hdegoede@redhat.com>
Message-ID: <c747e66d-26b2-20e0-31f9-d25de7c71a0b@linux.intel.com>
References: <20240421154520.37089-1-hdegoede@redhat.com> <20240421154520.37089-6-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-275107345-1713773460=:2288"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-275107345-1713773460=:2288
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 21 Apr 2024, Hans de Goede wrote:

> Use tpacpi_input_send_key() in adaptive_keyboard_hotkey_notify_hotkey()
> instead of re-implementing it there.
>=20
> Note this change will also result in a behavioral change, key presses on
> the adaptive keyboard will now also send a EV_MSC event with the scancode=
,
> just like all other hotkey presses already do. This is not a bug but
> a feature.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-275107345-1713773460=:2288--
