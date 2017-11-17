From: <Mario.Limonciello@dell.com>
Subject: Re: [PATCH] platform/x86: dell-smbios-wmi: Disable userspace
 interface if missing hotfix
Date: Fri, 17 Nov 2017 04:11:35 +0000
Message-ID: <1510891894741.31688@Dell.com>
References: <1510865310-19893-1-git-send-email-mario.limonciello@dell.com>,<20171117020023.GB22250@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:59895 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932489AbdKQELh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2017 23:11:37 -0500
In-Reply-To: <20171117020023.GB22250@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

>Is this "hotfix" the same thing as "having the latest firmware=0A=
>installed" ?=0A=
=0A=
>If so, making that clear in the dev_warn messages would be more useful=0A=
>to the person reading the log.=0A=
=0A=
Yes, I'll modify and re-send.=0A=
