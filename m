Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE2CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Jan 2022 15:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbiADPdy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Jan 2022 10:33:54 -0500
Received: from mga06.intel.com ([134.134.136.31]:41447 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231406AbiADPdx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jan 2022 10:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641310433; x=1672846433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xJZ9yposzbYbLGb5u6b9jzV8X8biepw/pQoGK27K7JY=;
  b=gTmfAlAcDQ4GBD7iWPuJyuhG8EbeL21FXLhT3LtTwIXlyr+J5cxe2YLK
   4zlyfsStIQIqKP2GhwTK2z4AmyRvYLg0brgDMzjGWzLIhW/ob9Sus39ON
   34Rmk2yYz/zlWgp15qY5StliDrpmaL+mdchniYF5qRMd07FStSFAiFuGy
   +0JdMkoTYIAto0X2cY/3+hR1ur8xhKUlOXj9LkF2+e+6gp1wABJJm7pvE
   PAU1WlDDwTEeP08oI7pOD7TWA2N10EZvEFzkjwIjdoQCRINpaQ4lGZDzp
   Va4WlZJLX06a4qhYOQ+RtlC7Dkib9iAt1gptnhqfkKVXj7nv7LaGML3Nk
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="302994878"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="302994878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 07:33:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; 
   d="scan'208";a="620687478"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 07:33:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n4lnc-006GCZ-GZ;
        Tue, 04 Jan 2022 17:32:32 +0200
Date:   Tue, 4 Jan 2022 17:32:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH] platform/x86: Add Asus TF103C dock driver
Message-ID: <YdRokPBoYYnF+D3D@smile.fi.intel.com>
References: <20211226141849.156407-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211226141849.156407-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Dec 26, 2021 at 03:18:49PM +0100, Hans de Goede wrote:
> Add a driver for the keyboard, touchpad and USB port of
> the keyboard dock for the Asus TF103C 2-in-1 tablet.
> 
> This keyboard dock has its own I2C attached embedded controller
> and the keyboard and touchpad are also connected over I2C,
> instead of using the usual USB connection. This means that the
> keyboard dock requires this special driver to function.

...

> +MODULE_PARM_DESC(fnlock,
> +		 "By default the kbd toprow sends multimedia key presses. AltGr "
> +		 "can be pressed to change this to F1-F12. Set this to 1 to "
> +		 "change the default. Press AltGr + Esc to toggle at runtime.");

I would still use long line instead of splitting.

...

> +/* Byte 0 is the length of the rest of the packet */
> +static const u8 tf103c_dock_enable_cmd[9] = { 8, 0x20, 0, 0, 0, 0, 0x20, 0, 0 };
> +static const u8 tf103c_dock_usb_enable_cmd[9] = { 8, 0, 0, 0, 0, 0, 0, 0x40, 0 };
> +static const u8 tf103c_dock_suspend_cmd[9] = { 8, 0, 0x20, 0, 0, 0x22, 0, 0, 0 };

This seems to me rather

struct {
	u8 cmd;
	DECLARE_BITMAP(payload, 64);
};

And those 2s and 4s are actually some bits in payload with some meaning.

Would it be the case?

...

> +/*** keyboard related code ***/

Not sure why you have all those fancy tri-stars comments. Probably it's
feliz año nuevo style -)

...

> +	ret = i2c_transfer(client->adapter, msgs, 2);
> +	if (ret != 2) {

2 --> ARRAY_SIZE() ?

> +		dev_err(dev, "error %d reading kbd data\n", ret);
> +		return -EIO;
> +	}

...

> +	buf[0] = TF103C_DOCK_KBD_CMD_REG & 0xff;
> +	buf[1] = TF103C_DOCK_KBD_CMD_REG >> 8;
> +	buf[2] = cmd & 0xff;
> +	buf[3] = cmd >> 8;

Seems to me like put_unaligned_le16() in both cases,

...

> +	ret = i2c_master_send(dock->kbd_client, buf, 4);
> +	if (ret != 4)

sizeof() / ARRAY_SIZE() ?

> +		dev_err(dev, "error %d writing kbd cmd\n", ret);

...

> +static const struct acpi_device_id tf103c_dock_acpi_match[] = {
> +	{"NPCE69A"},

> +	{ },

No comma is needed.

> +};

-- 
With Best Regards,
Andy Shevchenko


