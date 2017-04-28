From: Samuel Sieb <samuel@sieb.net>
Subject: Re: [PATCH] acer-wmi: setup accelerometer when appropriate acpi
 device was found
Date: Fri, 28 Apr 2017 11:30:50 -0700
Message-ID: <e136515b-c17c-7634-d46a-ad8b4db00d79@sieb.net>
References: <20170428082359.20034-1-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170428082359.20034-1-jlee@suse.com>
Content-Language: en-CA
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>
List-Id: platform-driver-x86.vger.kernel.org

On 04/28/2017 01:23 AM, Lee, Chun-Yi wrote:
> Fixes: 98d610c3739a ("acer-wmi: setup accelerometer when machine has appropriate notify event")
> Reference: https://bugzilla.kernel.org/show_bug.cgi?id=193761
> Reported-by: Samuel Sieb <samuel-kbugs@sieb.net>
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>

I have verified that this fixes the issue.
If you're going to include my name here, then please use my normal email 
address (samuel@sieb.net) instead of this one.
