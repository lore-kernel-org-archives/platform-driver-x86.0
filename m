From: Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH 0/2] hp-wmi: Fix dock status and tablet mode reporting
Date: Thu, 13 Apr 2017 08:28:38 +0200
Message-ID: <CAL9uMOEd0ocoV5-Chkk7KE-9AkV_6Q27N_OvJtHKqjJyvi9mWQ@mail.gmail.com>
References: <20170409135608.15621-1-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:34348 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756136AbdDMG2k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Apr 2017 02:28:40 -0400
Received: by mail-vk0-f44.google.com with SMTP id z204so23925067vkd.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2017 23:28:39 -0700 (PDT)
In-Reply-To: <20170409135608.15621-1-carlo@caione.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlo Caione <carlo@caione.org>
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

On Sun, Apr 9, 2017 at 3:56 PM, Carlo Caione <carlo@caione.org> wrote:
> From: Carlo Caione <carlo@endlessm.com>
>
> Several HP laptops cannot be put to sleep using the LID since systemd complains
> that the system is docked even though the laptop is not even dockable (see
> [1]).
>
> This is due to a bug in hp-wmi where the driver is failing to check for errors
> before creating the input switches.
>
> [1]: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1574120
>
> Carlo Caione (2):
>   hp-wmi: Fix error value for hp_wmi_tablet_state
>   hp-wmi: Fix detection for dock and tablet mode

Gentle ping.

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
