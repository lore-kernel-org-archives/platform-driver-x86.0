Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5CD20409E;
	Wed,  8 Jan 2025 22:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736374085; cv=none; b=RsnJPx/q89Y476H/oXqF7Au+nuXtuYeMiWLSGd2L+o9JjwLvyCWbi1ZQu2bEtvWyO/8Rm2e3rV8Ux6paIEdB/GvDMpWfyU6R13Zk7PBeq32bS62FsI3N3LVBYuA6TiCG3k02tzmI9/1Lmo9nqYc7BAX5oarSk+zfHZq+Rdtgjbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736374085; c=relaxed/simple;
	bh=E7GAG6mAv63BjlvrZAWjIVmzjvfMaxO6LhcOI4I6OM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOhLsG9xFGMSs9OY7FNMeDD6M72C24CcxNM5OWh9geDuOWqbG59aTbYBT5Pvecpg/ssu4qy0u7Oum73f5+XDk2IshAgeSqn9Pus6Hw06qzvdooJU9POmXA0XxNS0kIhGmJMwtfE1DQACdHVYndLNW3o1Y9QzHRjZFmMx7HzUPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=Pi4OyRdh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="Pi4OyRdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1736374069; bh=E7GAG6mAv63BjlvrZAWjIVmzjvfMaxO6LhcOI4I6OM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pi4OyRdhKO1W2vf6SUktiwAYJI2XTOCT5zJ6twy0uvHXNPtqOf3fS/uPN+0uPr3KM
	 uvk80NVuQeSETVLDTCHhL3T4vif0TegoyTN9lr/SKC/D7NA0uHlkurQbZVy+Ldj1Ir
	 Q9qL5/KaWWL8z+7TSe6bHbBs5ZGEf8flMp+WGzdg=
Date: Wed, 8 Jan 2025 23:07:49 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, W_Armin@gmx.de, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <19caaf5c-dbdd-43a4-989f-35a810dbe91a@t-8ch.de>
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <fb019bc7-72ba-4b1b-9260-36cac76a5a60@t-8ch.de>
 <CAMF+KebS6eEGEVzrO3Bm3CfL7OYP7-XxUp7hLiDiwUrjWOEJYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMF+KebS6eEGEVzrO3Bm3CfL7OYP7-XxUp7hLiDiwUrjWOEJYQ@mail.gmail.com>

Hi!

On 2025-01-08 22:37:01+0100, Joshua Grisham wrote:
> Hi Thomas! I was prepping my v5 patch to send in and trying to figure
> out everything I changed for the change list comments, but I stumbled
> on a few comments here that I wanted to ask you about as I realized I
> did not fully address them.
> 
> Den fre 3 jan. 2025 kl 20:37 skrev Thomas Weißschuh <thomas@t-8ch.de>:
> >
> 
> > > +This driver implements the
> > > +Documentation/userspace-api/sysfs-platform_profile.rst interface for working
> >
> > You can make this real reST link which will be converted into a
> > hyperlink.
> >
> 
> Here I actually tried this a few different ways (linking to the entire
> page instead of a specific section within the page) but would always
> get a warning and then no link when I built the docs. However, from
> finding other examples then I found just giving the path like this is
> actually giving me a link in both the htmldocs and pdfdocs with the
> title of the target page exactly as I wanted... with that in mind,
> does it seem ok to leave as-is or is there a syntax that you would
> recommend instead to link directly to a page (and not a section within
> a page)?

If it works, then leave it as is.
To exact warning would have been nice though :-)

Did you try :ref:`userspace-api/sysfs-platform_profile`?

> > > +static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_string method,
> > > +                               struct sawb *in_buf, size_t len, struct sawb *out_buf)
> >
> > in_buf and out_buf are always the same.
> >
> > > +{
> > > +     struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> > > +     union acpi_object in_obj, *out_obj;
> > > +     struct acpi_object_list input;
> > > +     acpi_status status;
> > > +     int err;
> > > +
> > > +     in_obj.type = ACPI_TYPE_BUFFER;
> > > +     in_obj.buffer.length = len;
> > > +     in_obj.buffer.pointer = (u8 *)in_buf;
> > > +
> > > +     input.count = 1;
> > > +     input.pointer = &in_obj;
> > > +
> > > +     status = acpi_evaluate_object_typed(galaxybook->acpi->handle, method, &input, &output,
> > > +                                         ACPI_TYPE_BUFFER);
> > > +
> > > +     if (ACPI_FAILURE(status)) {
> > > +             dev_err(&galaxybook->acpi->dev, "failed to execute method %s; got %s\n",
> > > +                     method, acpi_format_exception(status));
> > > +             return -EIO;
> > > +     }
> > > +
> > > +     out_obj = output.pointer;
> > > +
> > > +     if (out_obj->buffer.length != len || out_obj->buffer.length < SAWB_GUNM_POS + 1) {
> > > +             dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> > > +                     "response length mismatch\n", method);
> > > +             err = -EPROTO;
> > > +             goto out_free;
> > > +     }
> > > +     if (out_obj->buffer.pointer[SAWB_RFLG_POS] != RFLG_SUCCESS) {
> > > +             dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> > > +                     "device did not respond with success code 0x%x\n",
> > > +                     method, RFLG_SUCCESS);
> > > +             err = -ENXIO;
> > > +             goto out_free;
> > > +     }
> > > +     if (out_obj->buffer.pointer[SAWB_GUNM_POS] == GUNM_FAIL) {
> > > +             dev_err(&galaxybook->acpi->dev,
> > > +                     "failed to execute method %s; device responded with failure code 0x%x\n",
> > > +                     method, GUNM_FAIL);
> > > +             err = -ENXIO;
> > > +             goto out_free;
> > > +     }
> > > +
> > > +     memcpy(out_buf, out_obj->buffer.pointer, len);
> >
> > Nit: This memcpy() could be avoided by having the ACPI core write directly
> > into out_buf. It would also remove the allocation.
> >
> 
> Now I have replaced in_buf and out_buf with just one parameter, buf.
> Now it feels like I cannot write directly to it (since I am reusing
> the same buf as the outgoing value) so have left the memcpy in place.
> I guess I would need to choose to have 2 buffers or use one and do a
> memcpy at the end like this (which is how I have it now in my v5
> draft) .. am I thinking wrong here and/or is there a preference
> between the two alternatives? I can just for now say that "usage" of
> this function in all of the other functions feels easier to just have
> one buffer... :)

I'm not sure if there is a preference.

But why can't you modify the buffer if it is shared between input and
output? The caller already has to accept that its buffer will be
overwritten.
If it is overwritten once or twice should not matter.

But maybe I'm misunderstanding.

> > > +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
> > > +{
> > > +     struct sawb buf = { 0 };
> > > +
> > > +     buf.safn = SAFN;
> > > +     buf.sasb = SASB_POWER_MANAGEMENT;
> > > +     buf.gunm = GUNM_POWER_MANAGEMENT;
> > > +     buf.guds[0] = GUDS_POWER_ON_LID_OPEN;
> > > +     buf.guds[1] = GUDS_POWER_ON_LID_OPEN_SET;
> > > +     buf.guds[2] = value ? 1 : 0;
> >
> > No need for the ternary.
> >
> 
> I did not have this before but it was requested to be added by Ilpo
> IIRC. I am ok with either way but would just need to know which is
> preferred between the two :)

Then leave it as is.

> > > +static void galaxybook_i8042_filter_remove(void *data)
> > > +{
> > > +     struct samsung_galaxybook *galaxybook = data;
> > > +
> > > +     i8042_remove_filter(galaxybook_i8042_filter);
> > > +     if (galaxybook->has_kbd_backlight)
> > > +             cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
> > > +     if (galaxybook->has_camera_lens_cover)
> > > +             cancel_work_sync(&galaxybook->camera_lens_cover_hotkey_work);
> > > +}
> > > +
> > > +static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
> > > +{
> > > +     int err;
> > > +
> > > +     if (!galaxybook->has_kbd_backlight && !galaxybook->has_camera_lens_cover)
> > > +             return 0;
> > > +
> > > +     if (galaxybook->has_kbd_backlight)
> > > +             INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
> > > +                       galaxybook_kbd_backlight_hotkey_work);
> > > +
> > > +     if (galaxybook->has_camera_lens_cover)
> > > +             INIT_WORK(&galaxybook->camera_lens_cover_hotkey_work,
> > > +                       galaxybook_camera_lens_cover_hotkey_work);
> >
> > I would just always initialize and cancel the work_structs.
> > This is no hot path and it makes the code simpler.
> >
> 
> I apologize but I don't think I am 100% following what you mean here.
> Is there an example or more information that can be provided so I can
> know what should be changed here?

I would remove the conditionals for has_kbd_backlight and
has_camera_lens_cover. And unconditionally do:

INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
          galaxybook_kbd_backlight_hotkey_work);
INIT_WORK(&galaxybook->camera_lens_cover_hotkey_work,
          galaxybook_camera_lens_cover_hotkey_work);

> > > +     err = galaxybook_enable_acpi_notify(galaxybook);
> > > +     if (err)
> > > +             dev_warn(&galaxybook->platform->dev, "failed to enable ACPI notifications; "
> > > +                      "some hotkeys will not be supported\n");
> >
> > Will this dev_warn() trigger always for certain devices? If so a
> > dev_info() would be more appropriate IMO.
> >
> 
> Yes good point here; for the devices which have this condition, they
> will get this message every single time, so I will change it to info.
> I can also change it to debug if that makes even more sense.

debug would be even better, indeed.

> > [...]
> 
> Other than these I think (hope) I have tried to address everything
> else from all other comments. I will hold off on sending this v5 in
> case you reply soon-ish but otherwise will go ahead and send it as-is
> in the next day or two just to keep the feedback cycle going.

Looking forward to v5!
