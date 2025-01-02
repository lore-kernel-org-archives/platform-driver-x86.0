Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921535959;
	Thu,  2 Jan 2025 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735846903; cv=none; b=ak7Dr8+GNvMAsvrROpytWd+L9Y1izBcqNENu+fetI3E4benNbQKIuDbhvvB3GcYg2swDAb3lfD+7lj1hV3pr9/D3Hn7BZP5HtwhguEtvqN0wvoKZ8UhbjOV+XiLqO/p+jYGJP0Lpc/3nagmTHJcRzrMDXLJQGFetyOB1L1n4FUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735846903; c=relaxed/simple;
	bh=puJLQEP8nqD6qaASrATN51TS2cQEgxUQahb9r72B9p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxOvGJxBcXralElOkTbKGad9fVH1OSCSGDgQYN0QhlsU3wYoDt/iKxpsTits2i9ZPQKrUaflxcazRyXBWQS1WC1YAFKcJlr8MPels+fqbkK3e71NoBFtg/xEvSnjjGdrfJg+H9PBnAHnatFSSN+IDv3J236Lm8kln3V0VXVTtwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhZDn6gh; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhZDn6gh"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d8f916b40bso154333226d6.3;
        Thu, 02 Jan 2025 11:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735846899; x=1736451699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E93siwCyTNcngZbR9LYYjmI6dLhHcaQUmd8TVt1Jk9E=;
        b=MhZDn6ghj190XiVvxvhRkKlZywATJ+YGorOnhhtEo1Z2a9ruMpj58CA0ieORd1TZdV
         GXJWCX+mFxjdXSDu1wAYYwMVruZmRkZI76tu8KJljjOlWY3jXRI5FiC6guMw8svnpwGu
         KaKSNoxhhrRikoC1PUKWlAUHDl8BTyZIFjvrl9zR7wOVr+No0sS7tT+8h6mOSWy6nvAB
         Kzj3Hj/7M8IBeZDG9BHdyTgOpdy60vj07frCfJ6oKymlWJsHmielsQoDB+wEB9yOMPQ5
         dQibBHS8kpmMxljrt9i6DzAGR4OsQj4/56ldxKQL55yD/Yg//qtt2W2S50dygR5h/iWr
         1OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846899; x=1736451699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E93siwCyTNcngZbR9LYYjmI6dLhHcaQUmd8TVt1Jk9E=;
        b=T4r90XUMU9rNbd79BYw8KsIdpS0WY1LZt1RDE1fGkQ1FQvHQPeUvvH7VRQbIVxZBYt
         0YPlwjKa9tvl+y4aj+pGe5UkIeHf5gc7U/epxJP3xrrXmw1u6cU5S1CAyqIzy9tJh6e0
         usCbkWV0/uHBEcA6y6i197EiKq2yc2lO/PIj47dHjxbfFr38Nwl30u4V0PSiq3CgN0xF
         aOy2RPDOvZVPyXmqn7HiDOoGFuu9scz6o4Zp2CXzoOTZYwx2zT+8lSXNTd+/cVcUrTJi
         PiBAMGkMjqeMkxBt8xM6/GyCNneF92ilHLzVypxtfj//XgoKNvfgXmXa1IhlISWo0TRK
         U8hA==
X-Forwarded-Encrypted: i=1; AJvYcCWf4JuTTPEMtTIb9H0ZAN0tfQhnTJIezosMxXUGddCYynJgTYgPEm/MATqKx4ilHgzI/TH9SgQ6NC/oSqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIOVsUGB23evdrZwhlameoT82++RO1GAWxgKUgxM1yCCVXl9H
	LDxLhtDVYH35Q6IuAtuZKTqPVQ+U+yG9/cB2XMc1a+LYmJV4j9dG
X-Gm-Gg: ASbGnctuVZAR7fhirIf4wfqPGr/zYdLkAflcXfV00ra0Odr/tJVwTJFxmuSY7Cu+Ea4
	8R+gz6hBrox9q3JX66iVDiBO4to4Pm06g83CnXchQdygeF/L31mQeRfiMspBH70c8JtmLrDhyNs
	Fu5/0+K2Qpk4hD1eLwrsqb+0mFLEyMr81kS1Ggl/ZBNqOjq5gzsCr8tsdCUiqTyfolERE9sAIf3
	M2v8LR8OHmTK07KQOGUOH4TcPrMRjhuwyWNkI35AbZGYw6xRaWGKNf0
X-Google-Smtp-Source: AGHT+IE0a0ziebly9DPu5c/Vp9K6496kv+HB9oHMxbrPQVdrvu0qsfWPNQSqMTYzmgidSyYaKblnig==
X-Received: by 2002:ad4:5baa:0:b0:6d4:22d4:f5b0 with SMTP id 6a1803df08f44-6dd2338d333mr742751226d6.33.1735846899271;
        Thu, 02 Jan 2025 11:41:39 -0800 (PST)
Received: from alphacentauri ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddc5b6049bsm1567456d6.79.2025.01.02.11.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 11:41:38 -0800 (PST)
Date: Thu, 2 Jan 2025 14:41:35 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com
Subject: Re: [PATCH v2 00/20] alienware-wmi driver rework
Message-ID: <rmv4g3oo75rkimogaiz7ype2vdaw7hf4esa7vd4vklrswiywdt@rsdjiwzgjctw>
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <e5618537-a7ad-42e2-99d8-178ebc59192b@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5618537-a7ad-42e2-99d8-178ebc59192b@gmx.de>

On Thu, Jan 02, 2025 at 04:50:05PM +0100, Armin Wolf wrote:
> Am 29.12.24 um 20:44 schrieb Kurt Borja:
> 
> > Hi!
> > 
> > Happy holidays. :)
> 
> Hi,
> 
> i just noticed that your patch are missing the "platform/x86:" prefix. Please add this prefix
> for the next patch revision.

I will.

Thanks again for your review Armin!

~ Kurt

> 
> Thanks,
> Armin Wolf
> 
> > 
> > ~ Kurt
> > ---
> > v1 -> v2:
> > 
> > [2/20]
> >   - Small correction in commit message
> > 
> > [5/20]
> >   - Define the sysfs attributes without macros
> > 
> > [6/20]
> >   - Reworded commit title
> >   - Reorder variables in previous WMAX methods too
> >   - Standarized sysfs method names in hdmi, amplifier and deepsleep
> >     groups
> >   - Dropped Armin's Reviewed-by tag because this patch changed a lot
> > 
> > [7/20]
> >   - Return -ENOMEM in case priv allocation fails in alienfx_probe()
> >   - Assign priv and platdata on variable declaration
> >   - Drop intermediate *leds in alienfx_probe()
> >   - Add quirk_entry to state container
> >   - Use quirks from priv on hdmi_mux, amplifier, deepslp visibility
> >     methods, to eventually be able to move these groups into
> >     alienware-wmi-wmax.c
> >   - Set PROBE_FORCE_SYNCHRONOUS to platform_driver, to avoid racing to
> >     drvdata after using device_create_groups on [8/20]
> > 
> > [8/20]
> >   - Create hdmi, amplifier, deepslp sysfs groups on wmax's probe
> > 
> > [9/20]
> >   - Assign priv on variable declaration
> >   - Directly return create thermal_profile() in alienware_awcc_setup()
> > 
> > [10/20]
> >   - Refactored alienware_wmi_method following Armin's comments
> >   - Fix legacy_wmi_update_led logic
> > 
> > [13/20]
> >   - Split DMI table lower in the file
> >   - Rename quirk_entry -> alienfx_quirks
> >   - Rename awcc_features -> awcc_quirks
> >   - Make hdmi_mux, amplifier and deepslp `bool`
> > 
> > [16/20]:
> >   - Only add common resources on alienware.h
> > 
> > [17/20]
> >   - Reworded commit message: now mentions some blocks were reordered
> >   - Move #include <linux/dmi.h> where it belongs alphabetically
> >   - Included hdmi, amplifier, deepslp groups in alienware-wmi-wmax.c
> > 
> > [18/20]
> >   - static inline init functions in case drivers are not compiled
> >   - Return errno in case drivers are not compiled
> > 
> > v1: https://lore.kernel.org/platform-driver-x86/20241221055917.10555-1-kuurtb@gmail.com/
> > 
> > Kurt Borja (20):
> >    alienware-wmi: Remove unnecessary check at module exit
> >    alienware-wmi: Move Lighting Control State
> >    alienware-wmi: Modify parse_rgb() signature
> >    alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
> >    alienware-wmi: Improve rgb-zones group creation
> >    alienware_wmi: General cleanup of WMAX methods
> >    alienware-wmi: Add a state container for LED control feature
> >    alienware-wmi: Add WMI Drivers
> >    alienware-wmi: Add a state container for thermal control methods
> >    alienware-wmi: Refactor LED control methods
> >    alienware-wmi: Refactor hdmi, amplifier, deepslp methods
> >    alienware-wmi: Refactor thermal control methods
> >    alienware-wmi: Split DMI table
> >    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
> >    platform/x86: Rename alienware-wmi.c
> >    platform/x86: Add alienware-wmi.h
> >    platform-x86: Split the alienware-wmi driver
> >    platform/x86: dell: Modify Makefile alignment
> >    platform/x86: Update alienware-wmi config entries
> >    alienware-wmi: Update header and module information
> > 
> >   MAINTAINERS                                   |    4 +-
> >   drivers/platform/x86/dell/Kconfig             |   30 +-
> >   drivers/platform/x86/dell/Makefile            |   45 +-
> >   .../platform/x86/dell/alienware-wmi-base.c    |  492 +++++++
> >   .../platform/x86/dell/alienware-wmi-legacy.c  |   98 ++
> >   .../platform/x86/dell/alienware-wmi-wmax.c    |  775 ++++++++++
> >   drivers/platform/x86/dell/alienware-wmi.c     | 1269 -----------------
> >   drivers/platform/x86/dell/alienware-wmi.h     |  101 ++
> >   8 files changed, 1518 insertions(+), 1296 deletions(-)
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
> >   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
> > 
> > 
> > base-commit: 03f8e0e05510dad6377cd5ef029594d30e6c096d
