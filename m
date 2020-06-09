From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Tue, 9 Jun 2020 18:14:11 +0200
Message-ID: <10fcfbe7-cf2e-0911-334b-60be3336c990@redhat.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
 <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
 <137d8e69-a83f-6129-19e0-316ef0a51076@redhat.com>
 <ae45da27126d470888ef0d839665b9ed@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <ae45da27126d470888ef0d839665b9ed@AUSX13MPC105.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, y.linux@paritcher.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, pali@kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 6/9/20 5:36 PM, Mario.Limonciello@dell.com wrote:
> Loop linux-input mailing list and trim to the relevant conversation.
> 
>>> Can you please comment here how you would like to see events like this
>> should come
>>> through to userspace?
>>>
>>> * Wrong power adapter (you have X and should have Y)
>>> * You have plugged a dock into the wrong port
>>> * Fn-lock mode
>>
>> Note just thinking out loud here.
>>
>> I'm thinking we just need a mechanism to show a "user notification". This
>> would
>> be just a plain text string passed from the kernel to userspace. I guess we
>> may also want some mechanism to build (on the kernel side) a small file
>> with all possible messages for translation from US English to other
>> languages.
> 
> The part that falls apart here is that some strings have dynamic data added to
> them.  For example in the case I said wrong power adapter there will be some numbers
> put into the string based on what comes into the buffer.  So how will you translate
> these?
> 
> I guess you can draw a line in the sand and say all strings that can be emitted must
> be "static and generic".

Right, that is what I was thinking, although for the power adapter case
I was thinking there are not so much variants so we can just do
a couple of fixed strings for the combos, or maybe just sat that
the adapter does not delivers enough power and that at minimum X watts
is necessary" then we only have 1 variable and we can probably easily
do fixed strings for the few cases of X.

Or we could get fancy and do some generic notification mechanism outside
of printk/dmesg where we push a format string + parameters to the format
string to userspace. So that the translation can be done on the format
string rather then on the end result. I'm not sure we need to make things
that complicated though.

>> So the idea would be that e.g. gnome-shell can listen for these in some way
>> and then show a notification in its notification mechanism with the
>> message,
>> like how it does for when software updates are available for example.
>>
>> I think we can make this as simple as using the normal printk buffer for
>> this
>> and prefixing the messages with "USER NOTIFY", we already have some
>> messages
>> in the kernel which would qualify for this, e.g. in the USB core we have:
>>
>>                   dev_info(&udev->dev, "not running at top speed; "
>>                           "connect to a high speed hub\n");
>>
>> This one is about USB1 vs USB2 ports, but we have a similar one somewhere
>> for USB2 vs USB3 ports (I think) which would also be an interesting message
>> to actually show to the user inside the desktop environment.
>>
>> So sticking with the above example, we could change that to
>>
>> #define USER_NOTIFY "USER NOTIFY: "
>>
>> dev_info(&udev->dev, USER_NOTIFY "not running at top speed; connect to a
>> high speed hub\n");
>>
>> And then userspace would trigger on the "USER NOTIFY: " part, keep the
>> bit before it (which describes the device) as is, try to translate
>> the text after it and then combine the text before it + the possibly
>> translated text after it and show that as a notification.
>>
>> The reason for (ab)using the printk ring-buffer for this is that
>> we will still want to have these messages in dmesg too anyways,
>> so why add a new mechanism and send the same message twice if
>> we can just tag the messages inside the printk ring-buffer ?
>>
>> Note the dev_info above would likely be replaced with some new
>> helper which also does some magic to help with gathering a
>> list of strings to translate.
>>
>> Again just thinking out loud here. If anyone has any initial
>> reaction to this please let me know...
>>
> 
> As a general comment, I think it captures very well the possibility
> that the kernel has more information than userspace about the circumstances
> of something that a user should be notified.  Definitely that's the
> case for these WMI/ACPI events, and I would think similar circumstances
> can apply to other subsystem too.

Right, that was my idea behind having a generic notification mechanism.

Regards,

Hans
