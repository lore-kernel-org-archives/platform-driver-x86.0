Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494728;
	b=gHWT7Riqg27BLs8quoxUzY8IVfZWJKDJXs15IUt3hsN5BsQP5ymTyURNARpYL2YmlTfu
	 +eycriP4t6r5Q83sVCt+rRyfMaOlTQJuNAnfFJmzrol8GJXniw2GNkb8L24BFeK3xArd3
	 fCmmtknOXugoHrPFUdcJWiv9XI3rdprwuSQwyEETOHkPlVV0cU98p4UNls+ds++mYcziv
	 3IwVoVyyDAXM1j6ykIdNW8Aok06NayInORP3c0fhxsKPIurzPJtKKhzUHwYgslqYA/hhf
	 BU1qpMj5RSh/KmTmgYXwBIt2pzX9x7OTKSpD+dJZsIfxt3/AJvu/VYp1o1M2PjVwpyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494728;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=OlvD6qWYX5TPwPPJGJFpa1phzAGZVudCL4hA9Wqc+OA=;
	b=tfSRa/4XgxosEAXKYer89IqLTFC8A5CJp9gb5ddkjzrVmcDCAfp786JrDJG89LwM5yeW
	 azzFJjcUmTNjtdsaSevrqwRFgzYl9u3fbCPW0UTAcQbq3GRNCeJ3JB1420MJKXncVmJBD
	 GCo4DoCBo9IIISymEDzm8HcLUeFokPk/vSk1HTKbm1/9a/5XMUlXgtK8J0NM/gfamzRnv
	 +b/rraaQxMSLqlWxHf4pmh1zHF7Y1woLY+7Mt3HqopgDibW9STrh+WLqKQ4+SYBejgyD2
	 lbKcX8uMUEFl2AfrTNnQ5vu5KAMcH5HJsBPLg4CLAXVPknkuCPVTDolyR6aWq0OMY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NH2BWUQz;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E27360A2606;
	Tue, 20 Oct 2026 11:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E27360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NH2BWUQz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792494728; x=1824030728;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tTD5D9HGWwWv4lmp39AlmXuCHfj6p9aMEVN6rMeG39s=;
  b=NH2BWUQz7GLuQVO0AGgUZ8QZ3eI3yjel5B3956KoRPWC/UY+b4rMBrcg
   Q9x1Ujz+vrtqY9wqAcGj0sqC/DH6n0cs22qB/W9D+5i9ljcdotkXQXvwM
   CfZjbbV4CtWW9wlpYiQHl+KttbV8qTjozQsVF7XIkKJJZmN+A3Y9eziF2
   jeusZnpKBC7zXuox5xQ+H21Dq70xrVyHseTksWbLAuOrKWctqFqt+o+d7
   2Ol1KHXTmpFHKMO2KsxL9Sn+6H++JrjxA/VcVk271xZbnvn3O6OAnB6c1
   fkQxRDeo4H3MnQ0sep0i+uzG8gP+2msdg1+B6jQ/A4HNpAZWJ7whpE8G5
   Q==;
X-CSE-ConnectionGUID: t7UbD1FcQeus1MQIziDs1A==
X-CSE-MsgGUID: DHJxI8RuSTKOsMHJemNOhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1298671"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1298671"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:12:07 -0700
X-CSE-ConnectionGUID: PSy7AgGpTvqQ9gdC8wOgKQ==
X-CSE-MsgGUID: Ttq5+Vl6T32CwnkScmU4mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2863248"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:12:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 14:11:59 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: Evgeny Volferts <eugene.wolferz@gmail.com>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events
 on GU605MY
In-Reply-To: <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev>
Message-ID: <4304018d-8d92-bec8-d560-897813811a92@linux.intel.com>
References: <20261015163029.107250-1-eugene.wolferz@gmail.com> <d27c2b12-8968-4eec-b925-d5345ba1821e@linux.dev>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Oct 2026, Denis Benato wrote:

> 
> On 10/15/26 18:30, Evgeny Volferts wrote:
> > The ASUS ROG Zephyrus G16 GU605MY periodically emits an
> > unrecognized WMI event (0xe5), approximately every 12 seconds.
> >
> > The event is reported as KEY_UNKNOWN through the Asus WMI hotkeys
> > input device. When the session is locked, it causes both the
> > internal display and an external monitor connected through a
> > Thunderbolt dock to wake up repeatedly.
> >
> > Add a DMI-specific quirk to suppress this event on the GU605MY
> > without affecting other ASUS notebook models.
> >
> > Ignoring the event was first verified on a 7.2.7-based OGC kernel.
> > The DMI-specific quirk was subsequently built against 7.2.8-ogc5
> > and tested on 7.2.9-ogc2 and 7.2.9-ogc4. On both 7.2.9 variants,
> > the DMI match was confirmed and the unknown 0xe5 event messages
> > disappeared.
> 
> Hi Evgeny,
> 
> Thank you for your work!
> 
> I am thinking that a quirk with e5 in the name is a bit overly specific...
> 
> That code has never been handled and is just the EC repeating some settings.
> 
> I am thinking that perhaps the best thing to do is just create a case 0xE5 that
> simply does the ignore with no quirks check and a nice comment outlining
> why it is done.
> 
> I don't see asus repurposing that for something else honestly so it should
> be future-proof enough and will potentially avoid this to other models as
> well.
> 
> On the other end it would be cool to know what that really is telling us...
> 
> If you don't come up with an answer I would defer to Ilpo whether preferring
> reducing quirks or keeping the symmetry within that key_filter function.
> 
> I am fine either way.

Don't we need to touch the code anyway if the code is repurposed, so 
having this behind a quirk doesn't really win us anything over just 
ignoring it for any model.

-- 
 i.

> Best regards,
> Denis Benato
> 
> > Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
> > ---
> >  drivers/platform/x86/asus-nb-wmi.c | 17 +++++++++++++++++
> >  drivers/platform/x86/asus-wmi.h    |  1 +
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> > index aeb461b1644d..8d69231d25a0 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
> >  	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
> >  };
> >  
> > +static struct quirk_entry quirk_asus_gu605my = {
> > +	.ignore_e5_wmi_event = true,
> > +};
> > +
> >  static struct quirk_entry quirk_asus_z13 = {
> >  	.key_wlan_event = ASUS_WMI_KEY_ARMOURY,
> >  	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
> > @@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] = {
> >  		},
> >  		.driver_data = &quirk_asus_z13,
> >  	},
> > +	{
> > +		.callback = dmi_matched,
> > +		.ident = "ASUS ROG Zephyrus G16 GU605MY",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus G16 GU605MY_GU605MY"),
> > +		},
> > +		.driver_data = &quirk_asus_gu605my,
> > +	},
> >  	{},
> >  };
> >  
> > @@ -690,6 +703,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
> >  		if (quirks->key_wlan_event)
> >  			*code = quirks->key_wlan_event;
> >  		break;
> > +	case 0xE5:
> > +		if (quirks->ignore_e5_wmi_event)
> > +			*code = ASUS_WMI_KEY_IGNORE;
> > +		break;
> >  	}
> >  }
> >  
> > diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> > index 5cd4392b964e..e7772397cd10 100644
> > --- a/drivers/platform/x86/asus-wmi.h
> > +++ b/drivers/platform/x86/asus-wmi.h
> > @@ -41,6 +41,7 @@ struct quirk_entry {
> >  	bool wmi_force_als_set;
> >  	bool wmi_ignore_fan;
> >  	bool filter_i8042_e1_extended_codes;
> > +	bool ignore_e5_wmi_event;
> >  	int key_wlan_event;
> >  	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
> >  	int wapf;
> 

