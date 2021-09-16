Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7E7C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 08:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0252E6124D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 08:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhIPI1v convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:27:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:64477 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235009AbhIPI1u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 04:27:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202013382"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="202013382"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 01:26:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="553747262"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost) ([10.249.34.120])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 01:26:21 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Lyude Paul <lyude@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <Mario.limonciello@dell.com>
Subject: Re: [PATCH 1/9] drm/connector: Add support for privacy-screen properties (v4)
In-Reply-To: <9a843feee4c5b422b63f8cc5890bdfa67bbb0f17.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210906073519.4615-1-hdegoede@redhat.com> <20210906073519.4615-2-hdegoede@redhat.com> <9a843feee4c5b422b63f8cc5890bdfa67bbb0f17.camel@redhat.com>
Date:   Thu, 16 Sep 2021 11:26:06 +0300
Message-ID: <87y27xvsdd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 15 Sep 2021, Lyude Paul <lyude@redhat.com> wrote:
> On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
>>  
>> +       /**
>> +        * @privacy_screen_sw_state: See :ref:`Standard Connector
>> +        * Properties<standard_connector_properties>`
>> +        */
>
> So THAT'S how you reference other sections. I've always wondered!

You may find this helpful:

https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
