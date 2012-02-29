From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] platform/x86: Add driver for Apple gmux device
Date: Wed, 29 Feb 2012 15:23:20 -0600
Message-ID: <CACxGe6tK85FgYAT-1JQbLxEhRS34v2MPsx8urXADi6v2FnQ2gw@mail.gmail.com>
References: <1329424465-1211-1-git-send-email-seth.forshee@canonical.com>
 <1329921457-26887-1-git-send-email-seth.forshee@canonical.com>
 <CACxGe6sAcubJvc6LaVRxt+XzBz0jKpxSAPLdOvXkQz=NkXG5vQ@mail.gmail.com>
 <20120229175327.GA20565@ubuntu-macmini> <CACxGe6uc+LZjuMLS5DZELzAsHsnhObL6mdPzdMnNVbfriTfNwg@mail.gmail.com>
 <20120229195042.GB20565@ubuntu-macmini>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:52134 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756345Ab2B2VXk convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Feb 2012 16:23:40 -0500
Received: by obbta14 with SMTP id ta14so448969obb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Feb 2012 13:23:40 -0800 (PST)
In-Reply-To: <20120229195042.GB20565@ubuntu-macmini>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 29, 2012 at 1:50 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> On Wed, Feb 29, 2012 at 12:43:23PM -0600, Grant Likely wrote:
>> On Wed, Feb 29, 2012 at 11:53 AM, Seth Forshee
>> <seth.forshee@canonical.com> wrote:
>> > On Wed, Feb 29, 2012 at 11:46:39AM -0600, Grant Likely wrote:
>> >> On Wed, Feb 22, 2012 at 8:37 AM, Seth Forshee
>> >> <seth.forshee@canonical.com> wrote:
>> >> > Apple laptops with hybrid graphics have a device named gmux tha=
t
>> >> > controls the muxing of the LVDS panel between the GPUs as well =
as screen
>> >> > brightness. This driver adds support for the gmux device. Only =
backlight
>> >> > control is supported initially.
>> >> >
>> >> > Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
>> >>
>> >> Works for me.
>> >>
>> >> Tested-by: Grant Likely <grant.likely@secretlab.ca>
>> >>
>> >> Now I just need to figure out how to get the desktop backlight wi=
dget
>> >> to use gmux_backlight instead of acpi_video0...
>> >
>> > The easy way is to pass acpi_backlight=3Dvendor to the kernel, the=
n you
>> > won't have acpi_vidoe0.
>>
>> That did it, thanks. =A0I'm assume something is in the works to set =
it
>> up automatically?
>
> Not that I'm aware of. A number machines have this problem, that the
> standard ACPI backlight interfaces are implemented but don't work. Th=
is
> generally isn't detectable in software; with the Apples at least
> everything looks like it's working except that the brightness doesn't
> change (but not all Apple laptops are affected, so qurking based on
> manufacturer wouldn't work). All we're left with is DMI quirking, whi=
ch
> isn't practical. Maybe we could add something so a platform driver ca=
n
> tell acpi_video that it knows the ACPI backlight doesn't work, but I
> think on some platforms that still is going to be based off of DMI
> information.

blacklisting based on specific product name (ie. MacBookPro8,*) or
machine model is probably the best.  It wouldn't be the first
blacklist in the linux kernel.

g.
