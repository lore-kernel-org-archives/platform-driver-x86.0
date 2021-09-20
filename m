Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01798C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 21:08:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB81761107
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 21:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233887AbhITVJj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Sep 2021 17:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27883 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237433AbhITVHj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Sep 2021 17:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632171971;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QYU+FG0NgEDN5QbX73oIIwX0hoDQqIX9Lmp+LI9M8t8=;
        b=IVX8sqH0GkBdoygwqFlodSyNhOWnP5fNDyerDk+Af4qxE+nDFFDS2ntCIGXCY+kaRPmovT
        Ad1yMCkvyRdXzLZYccZY8FxGlA7LyrYyRrEFwjBMSbtogLxBM9mfSGd9NDVFoc9r3My1kh
        BvXdIAZlHf8KCnb2hbt/fWu46IylNKg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-9Eh1yvuDNlGQfqwwdASI5A-1; Mon, 20 Sep 2021 17:06:10 -0400
X-MC-Unique: 9Eh1yvuDNlGQfqwwdASI5A-1
Received: by mail-qv1-f69.google.com with SMTP id ib9-20020a0562141c8900b003671c3a1243so199039172qvb.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Sep 2021 14:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=QYU+FG0NgEDN5QbX73oIIwX0hoDQqIX9Lmp+LI9M8t8=;
        b=4Hm/XtRldxS0g7yehCdPboHU3wWtCn4xGVQhV3Tk/yDQhGwx7w0ci2pAZH1XPUpvqL
         IS+yH2fdnHr8OHTTblVHhIJWUZ6v6bxUmC8Mjcy+1FaOzmH7qm1njY4f3CO3ts5EqfRq
         ld/AJ9jgaO6FSC4kTGtC62uWOSEuvc7vrdBkazCl/+rdDTQIDag0AvBBpOnrIjrMpGpw
         rQCnucz9KbS20Gt9wrOlHiDz4KB0DgM4AE/3izcY92oK4wj67WB9oZUl3DXyBP43hL+Y
         XFYqeK5HBo8t2ZgcoKQ5TaDL4BJ0/WCG9c216HrleKkVInjcc/qNuk2jv2lhjkPrrvVs
         plgw==
X-Gm-Message-State: AOAM5338ElPqzD1gf1wAd+IABL4oBzvfHSal5W/T/uDqScbRBgKx7v4y
        cbeBJcSR9+X4XlpzRLXjomKvjPSJTEMBzHBAwMHaWj1EUHfxpm/h9AUqgT/io8AX/EBuVuJJOad
        xUznwI00zrEx8dgX2+rHSr889tzbG49HD6w==
X-Received: by 2002:ad4:44f3:: with SMTP id p19mr27905067qvt.33.1632171969963;
        Mon, 20 Sep 2021 14:06:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS2jHSKoCWXuvuoiupSPbp5jSZ8WpAjMlaKmSvPqiXflQvfBQ1tFrLdqMk5bP0vfLGV3tG7A==
X-Received: by 2002:ad4:44f3:: with SMTP id p19mr27905058qvt.33.1632171969792;
        Mon, 20 Sep 2021 14:06:09 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id x4sm7820134qkx.62.2021.09.20.14.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 14:06:09 -0700 (PDT)
Message-ID: <38aa092530b936609ba2b425e5caf2d63dbcf617.camel@redhat.com>
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Date:   Mon, 20 Sep 2021 17:06:07 -0400
In-Reply-To: <a4f10bbe-c87a-90f1-0691-01c0da485fa6@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
         <20210906073519.4615-10-hdegoede@redhat.com> <87sfy4x3ic.fsf@intel.com>
         <a4f10bbe-c87a-90f1-0691-01c0da485fa6@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 2021-09-16 at 12:32 +0200, Hans de Goede wrote:
> 
> I'm fine with refactoring this a bit and adding
> an intel_modeset_probe_defer() helper for this, I assume I should also
> move the vga_switcheroo_client_probe_defer(pdev) check there?
> 
> As you suggested yourself in your reply to the coverletter I will
> push out the rest of the series to drm-misc-next while we figure this
> out. Assuming Lyude is happy with the answers which I gave to her
> remarks about some of the other patches.

I am, btw!

> 
> Regards,
> 
> Hans
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

