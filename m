From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH v2 0/5] toshiba_acpi: Driver cleanup
Date: Wed, 6 May 2015 09:08:52 -0600
Message-ID: <CAGdLNWGxZ59RHuvqkjuXnMQELyh7BLsgO=NQi2U4-c9a+vRHxw@mail.gmail.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
	<20150506060035.GB7523@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150506060035.GB7523@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

2015-05-06 0:00 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Mon, May 04, 2015 at 11:15:53AM -0600, Azael Avalos wrote:
>> These patches cleanup the driver from some no longer needed
>> functions, renames hci_{read, write}1 functions, some comment
>> blocks were changed, unneeded error checks removed and the driver
>> version was bumped to 0.22.
>>
>> Changes since v1:
>> - Added two new patches to the series, one containing error check
>>   removals and another bumping the driver version.
>>
>> Darren:
>> Sorry for this, I totally forgot to include the patch to remove
>> the function error check :-(
>> Now this patchset is complete now :-)
>>
>
> So I'm a little confused :-) I have staged the patches locally as follows
> (newest first):
>
> <top>
> f6ea7d1 toshiba_acpi: Bump driver version to 0.22
> dd8b682 toshiba_acpi: Remove TOS_FAILURE check from some functions
> 60d9349 toshiba_acpi: Cleanup blank lines after comment blocks
> c62377a toshiba_acpi: Rename hci_{read, write}1 functions
> cbed7e3 toshiba_acpi: Remove no longer needed hci_{read, write}2 functions
> 8f163a9 toshiba_acpi: Remove bluetooth rfkill code
> 0a4c28f toshiba_bluetooth: Change BT status message to debug
> 3ad2df6 toshiba_bluetooth: Adapt *_enable, *_notify and *_resume functions to rfkill
> 9eb4797 toshiba_bluetooth: Add RFKill handler functions
> 1ae8cb3 toshiba_bluetooth: Add a container struct named toshiba_bluetooth_dev
> ...
>
> Is this what you had in mind?

The BT code removal from toshiba_acpi should come first, then the rfkill
to the toshiba_bluetooth driver, then all the rest :-)

>
> As for the comment cleanup (blank lines, etc.). Joe raised some points, I think I did too - is there another version of that patch coming?

Yeah, I'll send a v3 shortly, was in a meeting most of the day yesterday
and didn't had time to send it.

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
