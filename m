Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B00C433ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 08:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43DED613CE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 08:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235387AbhDVIwL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Apr 2021 04:52:11 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:33601 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhDVIwL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Apr 2021 04:52:11 -0400
Date:   Thu, 22 Apr 2021 08:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1619081494;
        bh=YnbXi/3E4d4OjVC6hxEORIpQ2rRhu1QXBlY5Yolf8UU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=nNc8+KMdq6ocE8qHrhGhCBd51bt2RLCCey73j+O3unz3sQqox8BihFDD/mjFrrDz/
         CunGnhbc+h3ujaA68IuYlMD/aqVpf4dms/BM3Rb1uptc4cew0R6e3+tjY6mlpWI+cb
         mzgFluR7QMvQMcZqftB4J0CWGdilBeI0QSpf8xGJfZMMmnsrU/M0Vde84p1VRk3Dg7
         EoZsVzc/ERbIjoeDatXOUtWwnMyIjF8Mqn1hQbe36jUe/KbL5FF4OZJEvB8kML+RnT
         lhpmLahYj3au4JOgWegDxSnyRK5jQ0ahuoieqKzVBmZF2BPpILaDFxO3SSHN0yxT4k
         RCvMOG/MZH3gA==
To:     Hans de Goede <hdegoede@redhat.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector properties
Message-ID: <OwVTQDmCbSZMBV41nuJO75afEwmVzcrgF9gLIDqAL4fODvfI-Md_R-Z-ifcVhy6VLc6FyOINwx6lUUz0B1hpykdQYe4b3iZALLftfk6yp_E=@emersion.fr>
In-Reply-To: <20210421204804.589962-1-hdegoede@redhat.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Wednesday, April 21st, 2021 at 10:47 PM, Hans de Goede <hdegoede@redhat.=
com> wrote:

> There now is GNOME userspace code using the new properties:
> https://hackmd.io/@3v1n0/rkyIy3BOw

Thanks for working on this.

Can these patches be submitted as merge requests against the upstream
projects? It would be nice to get some feedback from the maintainers,
and be able to easily leave some comments there as well.

Thanks,

Simon
