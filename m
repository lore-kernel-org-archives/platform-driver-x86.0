From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 16/16] platform/x86: dell-wmi: Convert to the WMI bus infrastructure
Date: Sat, 27 May 2017 09:04:38 -0700
Message-ID: <CALCETrWic6ZWrjdmXTRX92U058B1SZ+xMd+5TBW+YL51ZrgeCA@mail.gmail.com>
References: <cover.1495862272.git.dvhart@infradead.org> <4a4da770c8d0af7e3f31e79261b43573d70a6ea6.1495862272.git.dvhart@infradead.org>
 <201705271250.20338@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <201705271250.20338@pali>
Sender: linux-acpi-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, Rafael Wysocki <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, May 27, 2017 at 3:50 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Saturday 27 May 2017 07:31:30 Darren Hart wrote:
>> -     dell_wmi_input_dev->name = "Dell WMI hotkeys";
>> -     dell_wmi_input_dev->phys = "wmi/input0";
>> -     dell_wmi_input_dev->id.bustype = BUS_HOST;
>> +     priv->input_dev->name = "Dell WMI hotkeys";
>> +     priv->input_dev->id.bustype = BUS_HOST;
>
> Is not there BUS_WMI, or something like that? (Just asking)
>

Jiri and/or Dmitry, what is bustype for, anyway?  I suppose we could
add BUS_PLATFORM.
