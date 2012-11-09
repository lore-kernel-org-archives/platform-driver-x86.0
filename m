From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-laptop: Do not call HWRS on init
Date: Fri, 9 Nov 2012 14:15:31 +0000
Message-ID: <CAHR064iOcXhf=qHC_-Oi_4HVq9nvwGxcansFF0sAeAGk8Qf58A@mail.gmail.com>
References: <1352430453.4728.59.camel@deadeye.wl.decadent.org.uk>
	<CAHR064jyoG1A0NRpTPAqOF_1sVRdcM6kn0GQLx+j8UBY8kuaSw@mail.gmail.com>
	<CAHR064joxpAWnEr-hcQektejHQRZret98M-+F5fP2mivG0QHmg@mail.gmail.com>
	<1352469654.4728.74.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:61212 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753542Ab2KIOPe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Nov 2012 09:15:34 -0500
In-Reply-To: <1352469654.4728.74.camel@deadeye.wl.decadent.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: 692436@bugs.debian.org, ryan <draziw+deb@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, stable@vger.kernel.org, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>

On Fri, Nov 9, 2012 at 2:00 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Fri, 2012-11-09 at 09:20 +0000, Corentin Chary wrote:
>> On Fri, Nov 9, 2012 at 9:12 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
>> > On Fri, Nov 9, 2012 at 3:07 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
>> >> Since commit 8871e99f89b7 ('asus-laptop: HRWS/HWRS typo'), module
>> >> initialisation is very slow on the Asus UL30A.  The HWRS method takes
>> >> about 12 seconds to run, and subsequent initialisation also seems to
>> >> be delayed.  Since we don't really need the result, don't bother
>> >> calling it on init.  Those who are curious can still get the result
>> >> through the 'infos' device attribute.
>> >>
>> >> Update the comment about HWRS in show_infos().
>> >>
>> >> Reported-by: ryan <draziw+deb@gmail.com>
>> >> References: http://bugs.debian.org/692436
>> >> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>> >> Cc: <stable@vger.kernel.org> # v3.0+
>> >> ---
>> >>  drivers/platform/x86/asus-laptop.c |   17 ++++-------------
>> >>  1 file changed, 4 insertions(+), 13 deletions(-)
>> >>
>> >> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
>> >> index 4b568df..a961156 100644
>> >> --- a/drivers/platform/x86/asus-laptop.c
>> >> +++ b/drivers/platform/x86/asus-laptop.c
>> >> @@ -860,8 +860,10 @@ static ssize_t show_infos(struct device *dev,
>> >>         /*
>> >>          * The HWRS method return informations about the hardware.
>> >>          * 0x80 bit is for WLAN, 0x100 for Bluetooth.
>> >> +        * 0x40 for WWAN, 0x10 for WIMAX.
>> >>          * The significance of others is yet to be found.
>> >> -        * If we don't find the method, we assume the device are present.
>> >> +        * We don't currently use this for device detection, and it
>> >> +        * takes several seconds to run on some systems.
>> >>          */
>> >>         rv = acpi_evaluate_integer(asus->handle, "HWRS", NULL, &temp);
>> >>         if (!ACPI_FAILURE(rv))
>> >> @@ -1682,7 +1684,7 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
>> >>  {
>> >>         struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> >>         union acpi_object *model = NULL;
>> >> -       unsigned long long bsts_result, hwrs_result;
>> >> +       unsigned long long bsts_result;
>> >>         char *string = NULL;
>> >>         acpi_status status;
>> >>
>> >> @@ -1744,17 +1746,6 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
>> >>         if (*string)
>> >>                 pr_notice("  %s model detected\n", string);
>> >>
>> >> -       /*
>> >> -        * The HWRS method return informations about the hardware.
>> >> -        * 0x80 bit is for WLAN, 0x100 for Bluetooth,
>> >> -        * 0x40 for WWAN, 0x10 for WIMAX.
>> >> -        * The significance of others is yet to be found.
>> >> -        */
>> >> -       status =
>> >> -           acpi_evaluate_integer(asus->handle, "HWRS", NULL, &hwrs_result);
>> >> -       if (!ACPI_FAILURE(status))
>> >> -               pr_notice("  HWRS returned %x", (int)hwrs_result);
>> >> -
>> >>         if (!acpi_check_handle(asus->handle, METHOD_WL_STATUS, NULL))
>> >>                 asus->have_rsts = true;
>> >>
>> >>
>> >>
>> >
>> > Acked-by: Corentin Chary <corentin.chary@gmail.com>
>>
>> Arg, at first I though it was another gmail quirk, but it seems that
>> evolution broke your patch. Can you re-send it using git instead ?
>
> It's not broken, it's just signed - 'git am' has no problem with this.
> Well here it is again as an attachment.

Right, mutt works, sorry.
Thanks !

--
Corentin Chary
http://xf.iksaif.net
