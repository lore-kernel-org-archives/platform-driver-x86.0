From: Y Paritcher <y.linux@paritcher.com>
Subject: Re: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Mon, 8 Jun 2020 18:53:35 -0400
Message-ID: <53ad1d28-91d1-5dd0-3430-e2ee752df06f@paritcher.com>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
 <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
 <01169d6e-1bb1-6fc5-0690-0e8f44941cce@paritcher.com>
 <6cfba0ce42a74b39b5b80e9c621e2601@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6cfba0ce42a74b39b5b80e9c621e2601@AUSX13MPC105.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, hdegoede@redhat.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, pali@kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 6/8/20 6:00 PM, Mario.Limonciello@dell.com wrote:
>>
>> this is the WMI event from pressing the Fn lock key.
>> this indicates which mode it is switching to.
>>
>> this changes if the default for pressing the F[1-12] should be Function or
>> media.
>> the scancodes of the Fn keys are properly transmitted, this just inverts
>> which
>> ones are sent by default and which are sent when pressing the Fn+F[1-12]
>>
>> In other words, there are 24 scancode the only difference is which 12 are
>> default
>> and which 12 are when pressing with the Fn key
>>>>
>>>> Therefore i agree this should have it's own case in
> 
> To me this sounds like it makes most sense to either be an evdev switch which indicates
> which mode the fn key is set to when an event comes in.  You can populate the starting
> mode by looking up from a token.
> https://github.com/dell/libsmbios/blob/master/doc/token_list.csv#L987
> 
> Any other thoughts from others?
> 

beware that sometimes the key will do the unexpected.

If the Fn lock is turned off in the bios pressing the Fn lock key
will send an event with the current mode again, as switching is disallowed.
