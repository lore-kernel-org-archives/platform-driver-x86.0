From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 02/17] platform/x86: dell-wmi: increase severity of
 some failures
Date: Tue, 17 Oct 2017 20:42:18 +0200
Message-ID: <20171017184218.rhhon6swipfntn4s@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <b2b395af98ab4aa5973742d4f03486b59bbe18f2.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b2b395af98ab4aa5973742d4f03486b59bbe18f2.1508259916.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 17 October 2017 13:21:46 Mario Limonciello wrote:
> There is a lot of error checking in place for the format of the WMI
> descriptor buffer, but some of the potentially raised issues should
> be considered critical failures.
> 
> If the buffer size or header don't match, this is a good indication
> that the buffer format changed in a way that the rest of the data
> should not be relied upon.
> 
> For the remaining data set vectors, continue to notate a warning
> in undefined results, but as those are fields that the descriptor
> intended to refer to other applications, don't fail if they're new
> values.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

-- 
Pali Rohár
pali.rohar@gmail.com
