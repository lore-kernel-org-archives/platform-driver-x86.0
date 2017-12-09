From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/2] platform/x86: wmi: prefix sysfs files in /sys/bus/wmi with the ACPI device
Date: Fri, 8 Dec 2017 18:52:09 -0800
Message-ID: <DDE9D9EA-D55D-41CC-94ED-EB2A590B7BCF@amacapital.net>
References: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com> <1512786861-1014-2-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pl0-f46.google.com ([209.85.160.46]:33305 "EHLO
        mail-pl0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752620AbdLICwM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 21:52:12 -0500
Received: by mail-pl0-f46.google.com with SMTP id 36so1422559plc.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Dec 2017 18:52:12 -0800 (PST)
In-Reply-To: <1512786861-1014-2-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>



--Andy

> On Dec 8, 2017, at 6:34 PM, Mario Limonciello <mario.limonciello@dell.com>=
 wrote:
>=20
> It's possible for the same GUID to show up on as system twice.
> This means using solely the GUID for identify the file will not
> be sufficient.

Isn't the file already in a per-bus directory?
