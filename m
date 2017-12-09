From: <Mario.Limonciello@dell.com>
Subject: Re: [PATCH 1/2] platform/x86: wmi: prefix sysfs files in /sys/bus/wmi
 with the ACPI device
Date: Sat, 9 Dec 2017 03:41:00 +0000
Message-ID: <1512790860266.96149@Dell.com>
References: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com>
 <1512786861-1014-2-git-send-email-mario.limonciello@dell.com>,<DDE9D9EA-D55D-41CC-94ED-EB2A590B7BCF@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DDE9D9EA-D55D-41CC-94ED-EB2A590B7BCF@amacapital.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: luto@amacapital.net
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org
List-Id: platform-driver-x86.vger.kernel.org

>> On Dec 8, 2017, at 6:34 PM, Mario Limonciello <mario.limonciello@dell.co=
m> wrote:=0A=
>>=0A=
>> It's possible for the same GUID to show up on as system twice.=0A=
>> This means using solely the GUID for identify the file will not=0A=
>> be sufficient.=0A=
>=0A=
>Isn't the file already in a per-bus directory?=0A=
=0A=
Yep, but the symlink created in /sys/bus/wmi/devices isn't.=0A=
That's where the kernel complains about duplicate sysfs=0A=
attributes.=0A=
=0A=
It's not exactly a pretty path I submitted, but it does avoid=0A=
those collisions.=0A=
=0A=
Example (with this in place from /sys/bus/wmi/devices):=0A=
lrwxrwxrwx 1 root root 0 Dec  8 21:39 PNP0C14:04-70FE8229-D03B-4214-A1C6-1F=
884B1A892A -> ../../../devices/platform/PNP0C14:04/wmi_bus/wmi_bus-PNP0C14:=
04/PNP0C14:04-70FE8229-D03B-4214-A1C6-1F884B1A892A=0A=
