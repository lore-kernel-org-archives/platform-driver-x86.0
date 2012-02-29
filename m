From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] platform/x86: Add driver for Apple gmux device
Date: Wed, 29 Feb 2012 12:43:23 -0600
Message-ID: <CACxGe6uc+LZjuMLS5DZELzAsHsnhObL6mdPzdMnNVbfriTfNwg@mail.gmail.com>
References: <1329424465-1211-1-git-send-email-seth.forshee@canonical.com>
 <1329921457-26887-1-git-send-email-seth.forshee@canonical.com>
 <CACxGe6sAcubJvc6LaVRxt+XzBz0jKpxSAPLdOvXkQz=NkXG5vQ@mail.gmail.com> <20120229175327.GA20565@ubuntu-macmini>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:38484 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965939Ab2B2Snn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Feb 2012 13:43:43 -0500
Received: by obbta14 with SMTP id ta14so280771obb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Feb 2012 10:43:43 -0800 (PST)
In-Reply-To: <20120229175327.GA20565@ubuntu-macmini>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 29, 2012 at 11:53 AM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> On Wed, Feb 29, 2012 at 11:46:39AM -0600, Grant Likely wrote:
>> On Wed, Feb 22, 2012 at 8:37 AM, Seth Forshee
>> <seth.forshee@canonical.com> wrote:
>> > Apple laptops with hybrid graphics have a device named gmux that
>> > controls the muxing of the LVDS panel between the GPUs as well as screen
>> > brightness. This driver adds support for the gmux device. Only backlight
>> > control is supported initially.
>> >
>> > Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
>>
>> Works for me.
>>
>> Tested-by: Grant Likely <grant.likely@secretlab.ca>
>>
>> Now I just need to figure out how to get the desktop backlight widget
>> to use gmux_backlight instead of acpi_video0...
>
> The easy way is to pass acpi_backlight=vendor to the kernel, then you
> won't have acpi_vidoe0.

That did it, thanks.  I'm assume something is in the works to set it
up automatically?

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
