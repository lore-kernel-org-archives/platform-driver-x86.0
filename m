From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH] eeepc-wmi: add cpufv sysfs documentation
Date: Mon, 25 Oct 2010 08:32:49 -0500
Message-ID: <AANLkTin8t4Agfmxk9_DwdjLqcoOmX7rM1ikbfYYm3RNr@mail.gmail.com>
References: <1287869450-713-1-git-send-email-chris@cnpbagwell.com>
	<AANLkTinObWU504s4c21OEaoBhx4NvE2Ua2JSi17WdtMq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:54449 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755605Ab0JYNcu convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Oct 2010 09:32:50 -0400
Received: by gxk23 with SMTP id 23so1775165gxk.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Oct 2010 06:32:50 -0700 (PDT)
In-Reply-To: <AANLkTinObWU504s4c21OEaoBhx4NvE2Ua2JSi17WdtMq@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Mon, Oct 25, 2010 at 3:15 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> On Sat, Oct 23, 2010 at 11:30 PM, =A0<chris@cnpbagwell.com> wrote:
>> From: Chris Bagwell <chris@cnpbagwell.com>
>>
>> Based on cpufv text from sysfs-platform-eeepc-laptop that
>> has almost same behavior.
>> ---
>> =A0Documentation/ABI/testing/sysfs-platform-eeepc-wmi | =A0 10 +++++=
+++++
>> =A01 files changed, 10 insertions(+), 0 deletions(-)
>> =A0create mode 100644 Documentation/ABI/testing/sysfs-platform-eeepc=
-wmi
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-eeepc-wmi b/Do=
cumentation/ABI/testing/sysfs-platform-eeepc-wmi
>> new file mode 100644
>> index 0000000..5b0201b
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-eeepc-wmi
>> @@ -0,0 +1,10 @@
>> +What: =A0 =A0 =A0 =A0 =A0/sys/devices/platform/eeepc/cpufv
>> +Date: =A0 =A0 =A0 =A0 =A0Oct 2010
>> +KernelVersion: 2.6.37
>> +Contact: =A0 =A0 =A0 "Corentin Chary" <corentincj@iksaif.net>
>> +Description:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 Change CPU clock configuration (write-=
only).
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 There are three available clock config=
uration:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * 0 -> Super Performance Mode
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * 1 -> High Performance Mode
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * 2 -> Power Saving Mode
>> --
>> 1.7.3.1
>>
>>
>
> Hi Chris,
> Isn't the path /sys/devices/platform/eeepc-wmi/cpufv instead of
> /sys/devices/platform/eeepc/cpufv ?

Sure is!  Thanks for catching that.  I'll resend.
